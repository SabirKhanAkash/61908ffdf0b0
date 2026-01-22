import { VitalLogInput, ValidationError } from "../models/vital.model";

export function validateVitalLog(data: any): ValidationError[] {
    const errors: ValidationError[] = [];

    /// DEVICE ID VALIDATION
    if (!data.device_id) {
        errors.push({ field: 'device_id', message: 'Device ID is required' });
    }
    else if (typeof data.device_id !== 'string' || data.device_id.trim() === '') {
        errors.push({ field: 'device_id', message: 'Device ID must be a non-empty string' });
    }

    /// TIMESTAMP VALIDATION
    if (!data.timestamp) {
        errors.push({ field: 'timestamp', message: 'Timestamp is required' });
    }
    else {
        const timestamp = new Date(data.timestamp);
        if (isNaN(timestamp.getTime())) {
            errors.push({
                field: 'timestamp',
                message: 'Timestamp must be a valid ISO8601 datetime',
                value: data.timestamp
            });
        } else if (timestamp > new Date()) {
            errors.push({
                field: 'timestamp',
                message: 'Timestamp cannot be in the future',
                value: data.timestamp
            });
        }
    }

    /// THERMAL VALUE VALIDATION
    if (data.thermal_value === undefined || data.thermal_value === null) {
        errors.push({
            field: 'thermal_value',
            message: 'Thermal value is required'
        });
    }
    else if (!Number.isInteger(data.thermal_value)) {
        errors.push({
            field: 'thermal_value',
            message: 'Thermal value must be an integer'
        });
    }
    else if (data.thermal_value < 0 || data.thermal_value > 3) {
        errors.push({
            field: 'thermal_value',
            message: 'Thermal value must be between 0 and 3',
            value: data.thermal_value
        });
    }

    /// BATTERY LEVEL VALIDATION
    if (data.battery_level === undefined || data.battery_level === null) {
        errors.push({
            field: 'battery_level',
            message: 'Battery level is required'
        });
    }
    else if (typeof data.battery_level !== 'number') {
        errors.push({
            field: 'battery_level',
            message: 'Battery level must be a number',
            value: data.battery_level
        });
    }
    else if (data.battery_level < 0 || data.battery_level > 100) {
        errors.push({
            field: 'battery_level',
            message: 'Battery level must be between 0 and 100',
            value: data.battery_level
        });
    }

    /// MEMORY USAGE VALIDATION
    if (data.memory_usage === undefined || data.memory_usage === null) {
        errors.push({
            field: 'memory_usage',
            message: 'Memory usage is required'
        });
    }
    else if (typeof data.memory_usage !== 'number') {
        errors.push({
            field: 'memory_usage',
            message: 'Memory usage must be a number',
            value: data.memory_usage
        });
    }
    else if (data.memory_usage < 0 || data.memory_usage > 100) {
        errors.push({
            field: 'memory_usage',
            message: 'Memory usage must be between 0 and 100',
            value: data.memory_usage
        });
    }

    return errors;
}

export function isValid(errors: ValidationError[]): boolean {
    return errors.length === 0;
}