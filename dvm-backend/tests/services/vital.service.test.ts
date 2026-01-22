import { VitalService } from '../../src/services/vital.service';
import { VitalRepository } from '../../src/repositories/vital.repository';
import { VitalLog } from '../../src/models/vital.model';

// Mock repository
class MockVitalRepository {
    private logs: VitalLog[] = [];
    private nextId = 1;

    create(vital: any): VitalLog {
        const log: VitalLog = {
            id: this.nextId++,
            ...vital,
            created_at: new Date().toISOString(),
        };
        this.logs.push(log);
        return log;
    }

    getLatest(limit: number): VitalLog[] {
        return this.logs.slice(-limit).reverse();
    }

    calculateRollingAverage(limit: number) {
        const recentLogs = this.logs.slice(-limit);
        if (recentLogs.length === 0) {
            return { thermal: 0, battery: 0, memory: 0 };
        }

        const sum = recentLogs.reduce(
            (acc, log) => ({
                thermal: acc.thermal + log.thermal_value,
                battery: acc.battery + log.battery_level,
                memory: acc.memory + log.memory_usage,
            }),
            { thermal: 0, battery: 0, memory: 0 }
        );

        return {
            thermal: parseFloat((sum.thermal / recentLogs.length).toFixed(2)),
            battery: parseFloat((sum.battery / recentLogs.length).toFixed(2)),
            memory: parseFloat((sum.memory / recentLogs.length).toFixed(2)),
        };
    }

    count(): number {
        return this.logs.length;
    }

    countDevices(): number {
        const devices = new Set(this.logs.map(log => log.device_id));
        return devices.size;
    }

    getTimeRange() {
        if (this.logs.length === 0) {
            return { earliest: null, latest: null };
        }
        const timestamps = this.logs.map(log => log.timestamp).sort();
        return {
            earliest: timestamps[0],
            latest: timestamps[timestamps.length - 1],
        };
    }

    getByDeviceId(deviceId: string, limit: number): VitalLog[] {
        return this.logs.filter(log => log.device_id === deviceId).slice(-limit).reverse();
    }

    reset() {
        this.logs = [];
        this.nextId = 1;
    }
}

describe('VitalService', () => {
    let service: VitalService;
    let repository: MockVitalRepository;

    beforeEach(() => {
        repository = new MockVitalRepository();
        service = new VitalService(repository as any);
    });

    describe('createVitalLog', () => {
        it('should create a valid vital log', () => {
            const validData = {
                device_id: 'test-device-1',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 1,
                battery_level: 85,
                memory_usage: 60,
            };

            const result = service.createVitalLog(validData);

            expect(result.success).toBe(true);
            expect(result.data).toBeDefined();
            expect(result.data?.device_id).toBe('test-device-1');
        });

        it('should reject thermal_value outside 0-3 range', () => {
            const invalidData = {
                device_id: 'test-device',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 5, // Invalid
                battery_level: 85,
                memory_usage: 60,
            };

            const result = service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors).toBeDefined();
            expect(result.errors?.some(e => e.field === 'thermal_value')).toBe(true);
        });

        it('should reject battery_level outside 0-100 range', () => {
            const invalidData = {
                device_id: 'test-device',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 1,
                battery_level: 150, // Invalid
                memory_usage: 60,
            };

            const result = service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors?.some(e => e.field === 'battery_level')).toBe(true);
        });

        it('should reject memory_usage outside 0-100 range', () => {
            const invalidData = {
                device_id: 'test-device',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 1,
                battery_level: 85,
                memory_usage: -10, // Invalid
            };

            const result = service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors?.some(e => e.field === 'memory_usage')).toBe(true);
        });

        it('should reject future timestamps', () => {
            const futureDate = new Date();
            futureDate.setFullYear(futureDate.getFullYear() + 1);

            const invalidData = {
                device_id: 'test-device',
                timestamp: futureDate.toISOString(),
                thermal_value: 1,
                battery_level: 85,
                memory_usage: 60,
            };

            const result = service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors?.some(e => e.field === 'timestamp')).toBe(true);
        });

        it('should reject missing required fields', () => {
            const incompleteData = {
                device_id: 'test-device',
                // Missing timestamp
                thermal_value: 1,
                battery_level: 85,
                // Missing memory_usage
            };

            const result = service.createVitalLog(incompleteData);

            expect(result.success).toBe(false);
            expect(result.errors).toBeDefined();
            expect(result.errors!.length).toBeGreaterThan(0);
        });
    });

    describe('getAnalytics', () => {
        it('should calculate correct rolling average', () => {
            // Add test data
            service.createVitalLog({
                device_id: 'device-1',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 0,
                battery_level: 80,
                memory_usage: 50,
            });

            service.createVitalLog({
                device_id: 'device-1',
                timestamp: '2024-01-20T10:01:00Z',
                thermal_value: 2,
                battery_level: 60,
                memory_usage: 70,
            });

            const analytics = service.getAnalytics();

            expect(analytics.rolling_average.thermal).toBe(1); // (0 + 2) / 2
            expect(analytics.rolling_average.battery).toBe(70); // (80 + 60) / 2
            expect(analytics.rolling_average.memory).toBe(60); // (50 + 70) / 2
            expect(analytics.total_logs).toBe(2);
        });

        it('should return zero averages when no data', () => {
            const analytics = service.getAnalytics();

            expect(analytics.rolling_average.thermal).toBe(0);
            expect(analytics.rolling_average.battery).toBe(0);
            expect(analytics.rolling_average.memory).toBe(0);
            expect(analytics.total_logs).toBe(0);
        });
    });
});