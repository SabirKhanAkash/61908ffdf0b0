import { validateVitalLog, isValid } from '../../src/utils/validators';

describe('Validators', () => {
    describe('validateVitalLog', () => {
        const validData = {
            device_id: 'test-device',
            timestamp: '2024-01-20T10:00:00Z',
            thermal_value: 1,
            battery_level: 85,
            memory_usage: 60,
        };

        it('should pass validation for valid data', () => {
            const errors = validateVitalLog(validData);
            expect(isValid(errors)).toBe(true);
            expect(errors.length).toBe(0);
        });

        describe('thermal_value validation', () => {
            it('should reject thermal_value < 0', () => {
                const errors = validateVitalLog({ ...validData, thermal_value: -1 });
                expect(isValid(errors)).toBe(false);
                expect(errors.some(e => e.field === 'thermal_value')).toBe(true);
            });

            it('should reject thermal_value > 3', () => {
                const errors = validateVitalLog({ ...validData, thermal_value: 4 });
                expect(isValid(errors)).toBe(false);
                expect(errors.some(e => e.field === 'thermal_value')).toBe(true);
            });

            it('should accept thermal_value = 0', () => {
                const errors = validateVitalLog({ ...validData, thermal_value: 0 });
                expect(isValid(errors)).toBe(true);
            });

            it('should accept thermal_value = 3', () => {
                const errors = validateVitalLog({ ...validData, thermal_value: 3 });
                expect(isValid(errors)).toBe(true);
            });

            it('should reject non-integer thermal_value', () => {
                const errors = validateVitalLog({ ...validData, thermal_value: 1.5 });
                expect(isValid(errors)).toBe(false);
            });

            it('should reject missing thermal_value', () => {
                const { thermal_value, ...dataWithoutThermal } = validData;
                const errors = validateVitalLog(dataWithoutThermal);
                expect(isValid(errors)).toBe(false);
                expect(errors.some(e => e.field === 'thermal_value')).toBe(true);
            });
        });

        describe('battery_level validation', () => {
            it('should reject battery_level < 0', () => {
                const errors = validateVitalLog({ ...validData, battery_level: -1 });
                expect(isValid(errors)).toBe(false);
            });

            it('should reject battery_level > 100', () => {
                const errors = validateVitalLog({ ...validData, battery_level: 101 });
                expect(isValid(errors)).toBe(false);
            });

            it('should accept battery_level = 0', () => {
                const errors = validateVitalLog({ ...validData, battery_level: 0 });
                expect(isValid(errors)).toBe(true);
            });

            it('should accept battery_level = 100', () => {
                const errors = validateVitalLog({ ...validData, battery_level: 100 });
                expect(isValid(errors)).toBe(true);
            });

            it('should accept decimal battery_level', () => {
                const errors = validateVitalLog({ ...validData, battery_level: 85.5 });
                expect(isValid(errors)).toBe(true);
            });
        });

        describe('memory_usage validation', () => {
            it('should reject memory_usage < 0', () => {
                const errors = validateVitalLog({ ...validData, memory_usage: -1 });
                expect(isValid(errors)).toBe(false);
            });

            it('should reject memory_usage > 100', () => {
                const errors = validateVitalLog({ ...validData, memory_usage: 150 });
                expect(isValid(errors)).toBe(false);
            });

            it('should accept memory_usage = 0', () => {
                const errors = validateVitalLog({ ...validData, memory_usage: 0 });
                expect(isValid(errors)).toBe(true);
            });

            it('should accept memory_usage = 100', () => {
                const errors = validateVitalLog({ ...validData, memory_usage: 100 });
                expect(isValid(errors)).toBe(true);
            });
        });

        describe('timestamp validation', () => {
            it('should reject future timestamps', () => {
                const future = new Date();
                future.setFullYear(future.getFullYear() + 1);
                const errors = validateVitalLog({ ...validData, timestamp: future.toISOString() });
                expect(isValid(errors)).toBe(false);
                expect(errors.some(e => e.field === 'timestamp')).toBe(true);
            });

            it('should accept current timestamp', () => {
                const now = new Date().toISOString();
                const errors = validateVitalLog({ ...validData, timestamp: now });
                expect(isValid(errors)).toBe(true);
            });

            it('should accept past timestamp', () => {
                const past = new Date('2020-01-01T00:00:00Z').toISOString();
                const errors = validateVitalLog({ ...validData, timestamp: past });
                expect(isValid(errors)).toBe(true);
            });

            it('should reject invalid timestamp format', () => {
                const errors = validateVitalLog({ ...validData, timestamp: 'invalid-date' });
                expect(isValid(errors)).toBe(false);
            });

            it('should reject missing timestamp', () => {
                const { timestamp, ...dataWithoutTimestamp } = validData;
                const errors = validateVitalLog(dataWithoutTimestamp);
                expect(isValid(errors)).toBe(false);
            });
        });

        describe('device_id validation', () => {
            it('should reject empty device_id', () => {
                const errors = validateVitalLog({ ...validData, device_id: '' });
                expect(isValid(errors)).toBe(false);
            });

            it('should reject missing device_id', () => {
                const { device_id, ...dataWithoutDeviceId } = validData;
                const errors = validateVitalLog(dataWithoutDeviceId);
                expect(isValid(errors)).toBe(false);
            });

            it('should reject whitespace-only device_id', () => {
                const errors = validateVitalLog({ ...validData, device_id: '   ' });
                expect(isValid(errors)).toBe(false);
            });
        });

        describe('multiple validation errors', () => {
            it('should return all validation errors', () => {
                const invalidData = {
                    device_id: '',
                    timestamp: 'invalid',
                    thermal_value: 10,
                    battery_level: 200,
                    memory_usage: -50,
                };

                const errors = validateVitalLog(invalidData);
                expect(errors.length).toBeGreaterThanOrEqual(5);
            });
        });
    });
});