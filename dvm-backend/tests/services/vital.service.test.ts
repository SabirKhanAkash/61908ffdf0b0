import { VitalService } from '../../src/services/vital.service';
import { VitalLog } from '../../src/models/vital.model';

// Mock repository
class MockVitalRepository {
    private logs: VitalLog[] = [];
    private nextId = 1;

    async create(vital: any): Promise<VitalLog> {
        const log: VitalLog = {
            id: this.nextId++,
            ...vital,
            created_at: new Date().toISOString(),
        };
        this.logs.push(log);
        return log;
    }

    async getLatest(limit: number, deviceId?: string): Promise<VitalLog[]> {
        let filtered = this.logs;
        if (deviceId) {
            filtered = filtered.filter(l => l.device_id === deviceId);
        }
        return filtered.slice(-limit).reverse();
    }

    async calculateRollingAverage(limit: number, deviceId?: string) {
        let filtered = this.logs;
        if (deviceId) {
            filtered = filtered.filter(l => l.device_id === deviceId);
        }
        const recentLogs = filtered.slice(-limit);
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

    async count(deviceId?: string): Promise<number> {
        if (deviceId) {
            return this.logs.filter(l => l.device_id === deviceId).length;
        }
        return this.logs.length;
    }

    async countDevices(): Promise<number> {
        const devices = new Set(this.logs.map(log => log.device_id));
        return devices.size;
    }

    async getTimeRange(deviceId?: string) {
        let filtered = this.logs;
        if (deviceId) {
            filtered = filtered.filter(l => l.device_id === deviceId);
        }
        if (filtered.length === 0) {
            return { earliest: null, latest: null };
        }
        const timestamps = filtered.map(log => log.timestamp).sort();
        return {
            earliest: timestamps[0],
            latest: timestamps[timestamps.length - 1],
        };
    }

    async getByDeviceId(deviceId: string, limit: number): Promise<VitalLog[]> {
        return this.logs.filter(log => log.device_id === deviceId).slice(-limit).reverse();
    }

    async getMinMax(since?: string, deviceId?: string): Promise<{
        thermal: { min: number; max: number };
        battery: { min: number; max: number };
        memory: { min: number; max: number };
    }> {
        let filteredLogs = this.logs;
        if (since) {
            filteredLogs = filteredLogs.filter(log => log.timestamp >= since);
        }
        if (deviceId) {
            filteredLogs = filteredLogs.filter(log => log.device_id === deviceId);
        }

        if (filteredLogs.length === 0) {
            return {
                thermal: { min: 0, max: 0 },
                battery: { min: 0, max: 0 },
                memory: { min: 0, max: 0 }
            };
        }

        return {
            thermal: {
                min: Math.min(...filteredLogs.map(l => l.thermal_value)),
                max: Math.max(...filteredLogs.map(l => l.thermal_value))
            },
            battery: {
                min: Math.min(...filteredLogs.map(l => l.battery_level)),
                max: Math.max(...filteredLogs.map(l => l.battery_level))
            },
            memory: {
                min: Math.min(...filteredLogs.map(l => l.memory_usage)),
                max: Math.max(...filteredLogs.map(l => l.memory_usage))
            }
        };
    }

    async reset() {
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
        it('should create a valid vital log', async () => {
            const validData = {
                device_id: 'test-device-1',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 1,
                battery_level: 85,
                memory_usage: 60,
            };

            const result = await service.createVitalLog(validData);

            expect(result.success).toBe(true);
            expect(result.data).toBeDefined();
            expect(result.data?.device_id).toBe('test-device-1');
        });

        it('should reject thermal_value outside 0-3 range', async () => {
            const invalidData = {
                device_id: 'test-device',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 5, // Invalid
                battery_level: 85,
                memory_usage: 60,
            };

            const result = await service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors).toBeDefined();
            expect(result.errors?.some(e => e.field === 'thermal_value')).toBe(true);
        });

        it('should reject battery_level outside 0-100 range', async () => {
            const invalidData = {
                device_id: 'test-device',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 1,
                battery_level: 150, // Invalid
                memory_usage: 60,
            };

            const result = await service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors?.some(e => e.field === 'battery_level')).toBe(true);
        });

        it('should reject memory_usage outside 0-100 range', async () => {
            const invalidData = {
                device_id: 'test-device',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 1,
                battery_level: 85,
                memory_usage: -10, // Invalid
            };

            const result = await service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors?.some(e => e.field === 'memory_usage')).toBe(true);
        });

        it('should reject future timestamps', async () => {
            const futureDate = new Date();
            futureDate.setFullYear(futureDate.getFullYear() + 1);

            const invalidData = {
                device_id: 'test-device',
                timestamp: futureDate.toISOString(),
                thermal_value: 1,
                battery_level: 85,
                memory_usage: 60,
            };

            const result = await service.createVitalLog(invalidData);

            expect(result.success).toBe(false);
            expect(result.errors?.some(e => e.field === 'timestamp')).toBe(true);
        });

        it('should reject missing required fields', async () => {
            const incompleteData = {
                device_id: 'test-device',
                // Missing timestamp
                thermal_value: 1,
                battery_level: 85,
                // Missing memory_usage
            };

            const result = await service.createVitalLog(incompleteData);

            expect(result.success).toBe(false);
            expect(result.errors).toBeDefined();
            expect(result.errors!.length).toBeGreaterThan(0);
        });
    });

    describe('getAnalytics', () => {
        it('should calculate correct rolling average and min/max', async () => {
            // Add test data
            await service.createVitalLog({
                device_id: 'device-1',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 0,
                battery_level: 80,
                memory_usage: 50,
            });

            await service.createVitalLog({
                device_id: 'device-1',
                timestamp: '2024-01-20T10:01:00Z',
                thermal_value: 2,
                battery_level: 60,
                memory_usage: 70,
            });

            const analytics = await service.getAnalytics();

            expect(analytics.rolling_average.thermal).toBe(1); // (0 + 2) / 2
            expect(analytics.rolling_average.battery).toBe(70); // (80 + 60) / 2
            expect(analytics.rolling_average.memory).toBe(60); // (50 + 70) / 2

            expect(analytics.min_max.all_time.thermal).toEqual({ min: 0, max: 2 });
            expect(analytics.min_max.all_time.battery).toEqual({ min: 60, max: 80 });
            expect(analytics.min_max.all_time.memory).toEqual({ min: 50, max: 70 });

            expect(analytics.total_logs).toBe(2);
        });

        it('should return zero values when no data', async () => {
            const analytics = await service.getAnalytics();

            expect(analytics.rolling_average.thermal).toBe(0);
            expect(analytics.rolling_average.battery).toBe(0);
            expect(analytics.rolling_average.memory).toBe(0);

            expect(analytics.min_max.all_time.thermal).toEqual({ min: 0, max: 0 });

            expect(analytics.total_logs).toBe(0);
        });

        it('should filter analytics by device_id', async () => {
            // Add data for two different devices
            await service.createVitalLog({
                device_id: 'device-1',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 0,
                battery_level: 80,
                memory_usage: 50,
            });

            await service.createVitalLog({
                device_id: 'device-2',
                timestamp: '2024-01-20T10:01:00Z',
                thermal_value: 2, // Only for device-2
                battery_level: 60,
                memory_usage: 70,
            });

            const analytics = await service.getAnalytics('device-1');

            expect(analytics.total_logs).toBe(1);
            expect(analytics.rolling_average.thermal).toBe(0); // device-1 has 0
            expect(analytics.min_max.all_time.thermal).toEqual({ min: 0, max: 0 });
        });
    });

    describe('getLatestLogs', () => {
        it('should filter logs by device_id', async () => {
            await service.createVitalLog({
                device_id: 'device-1',
                timestamp: '2024-01-20T10:00:00Z',
                thermal_value: 0,
                battery_level: 80,
                memory_usage: 50,
            });

            await service.createVitalLog({
                device_id: 'device-2',
                timestamp: '2024-01-20T10:01:00Z',
                thermal_value: 2,
                battery_level: 60,
                memory_usage: 70,
            });

            const device1Logs = await service.getLatestLogs(10, 'device-1');
            const allLogs = await service.getLatestLogs(10);

            expect(device1Logs.length).toBe(1);
            expect(device1Logs[0].device_id).toBe('device-1');
            expect(allLogs.length).toBe(2);
        });
    });
});