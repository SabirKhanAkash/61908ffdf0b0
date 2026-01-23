import { VitalRepository } from "../repositories/vital.repository";
import { VitalLog, VitalLogInput, VitalAnalytics } from "../models/vital.model";
import { validateVitalLog, isValid } from "../utils/validators";

export class VitalService {
    private repository: VitalRepository;

    constructor(repository: VitalRepository) {
        this.repository = repository;
    }

    async createVitalLog(data: any): Promise<{ success: boolean; data?: VitalLog; errors?: any[] }> {
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
            const createdVitalLog = await this.repository.create(vitalLog);
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

    async getLatestLogs(limit: number = 100): Promise<VitalLog[]> {
        return await this.repository.getLatest(limit);
    }

    async getAnalytics(): Promise<VitalAnalytics> {
        const [rollingAverage, totalLogs, deviceCount, timeRange] = await Promise.all([
            this.repository.calculateRollingAverage(100),
            this.repository.count(),
            this.repository.countDevices(),
            this.repository.getTimeRange()
        ]);

        const analytics: VitalAnalytics = {
            rolling_average: rollingAverage,
            total_logs: totalLogs,
            latest_timestamp: timeRange.latest,
            device_count: deviceCount,
            time_range: timeRange,
        };

        return analytics;
    }

    async getDeviceLogs(deviceId: string, limit: number = 100): Promise<VitalLog[]> {
        return await this.repository.getByDeviceId(deviceId, limit);
    }
}