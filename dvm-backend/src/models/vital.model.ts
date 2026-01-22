export interface VitalLog {
    id?: number;
    device_id: string;
    timestamp: string;
    thermal_value: number;
    battery_level: number;
    memory_usage: number;
    created_at?: string;
}

export interface VitalLogInput {
    device_id: string;
    timestamp: string;
    thermal_value: number;
    battery_level: number;
    memory_usage: number;
}

export interface VitalAnalytics {
    rolling_average: {
        thermal: number;
        battery: number;
        memory: number;
    };
    total_logs: number;
    latest_timestamp: string | null;
    device_count: number;
    time_range: {
        earliest: string | null;
        latest: string | null;
    };
}

export interface ValidationError {
    field: string;
    message: string;
    value?: any;
}