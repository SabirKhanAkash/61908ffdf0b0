import { VitalRepository } from "../repositories/vital.repository";
import { VitalLog, VitalLogInput, VitalAnalytics } from "../models/vital.model";
import { validateVitalLog, isValid } from "../utils/validators";

export class VitalService {
    private repository: VitalRepository;

    constructor(repository: VitalRepository) {
        this.repository = repository;
    }

    createVitalLog(data: any): { success: boolean; data?: VitalLog; errors?: any[] } {
        const validationErrors = validateVitalLog(data);

        if (!isValid(validationErrors)) {
            return {
                success: false,
                errors: validationErrors
            };
        }

        try {
            const vitalLog: VitalLogInput = {
                device_id: data.device_id,
                timestamp: data.timestamp,
                thermal_value: data.thermal_value,
                battery_level: data.battery_level,
                memory_usage: data.memory_usage
            };
            const createdVitalLog = this.repository.create(vitalLog);
            return {
                success: true,
                data: createdVitalLog
            };
        } catch (error: any) {
            if (error.message && error.message.includes('CHECK constraint failed')) {
                return {
                    success: false,
                    errors: [{ field: 'database', message: 'Data validation failed at database level' }],
                };
            }
            throw error;
        }
    }

    getLatestLogs(limit: number = 100): VitalLog[] {
        return this.repository.getLatest(limit);
    }

    getAnalytics(): VitalAnalytics {
        const rollingAverage = this.repository.calculateRollingAverage(100);
        const totalLogs = this.repository.count();
        const deviceCount = this.repository.countDevices();
        const timeRange = this.repository.getTimeRange();

        const analytics: VitalAnalytics = {
            rolling_average: rollingAverage,
            total_logs: totalLogs,
            latest_timestamp: timeRange.latest,
            device_count: deviceCount,
            time_range: timeRange,
        };

        return analytics;
    }

    getDeviceLogs(deviceId: string, limit: number = 100): VitalLog[] {
        return this.repository.getByDeviceId(deviceId, limit);
    }
}