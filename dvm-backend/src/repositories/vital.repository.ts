import { Client } from '@libsql/client';
import { VitalLog, VitalLogInput } from '../models/vital.model';

export class VitalRepository {
    private db: Client;

    constructor(database: Client) {
        this.db = database;
    }

    async create(vital: VitalLogInput): Promise<VitalLog> {
        const result = await this.db.execute({
            sql: `INSERT INTO vitals (device_id, timestamp, thermal_value, battery_level, memory_usage)
                  VALUES (?, ?, ?, ?, ?)`,
            args: [
                vital.device_id,
                vital.timestamp,
                vital.thermal_value,
                vital.battery_level,
                vital.memory_usage
            ]
        });

        const createdResult = await this.db.execute({
            sql: `SELECT * FROM vitals WHERE id = ?`,
            args: [Number(result.lastInsertRowid)]
        });

        return createdResult.rows[0] as unknown as VitalLog;
    }

    async getLatest(limit: number = 100): Promise<VitalLog[]> {
        const result = await this.db.execute({
            sql: `SELECT * FROM vitals ORDER BY timestamp DESC, created_at DESC LIMIT ?`,
            args: [limit]
        });
        return result.rows as unknown as VitalLog[];
    }

    async getAll(): Promise<VitalLog[]> {
        const result = await this.db.execute(`SELECT * FROM vitals ORDER BY timestamp DESC`);
        return result.rows as unknown as VitalLog[];
    }

    async getByDeviceId(deviceId: string, limit: number = 100): Promise<VitalLog[]> {
        const result = await this.db.execute({
            sql: `SELECT * FROM vitals WHERE device_id = ? ORDER BY timestamp DESC LIMIT ?`,
            args: [deviceId, limit]
        });
        return result.rows as unknown as VitalLog[];
    }

    async count(): Promise<number> {
        const result = await this.db.execute('SELECT COUNT(*) as count FROM vitals');
        return result.rows[0].count as number;
    }

    async countDevices(): Promise<number> {
        const result = await this.db.execute('SELECT COUNT(DISTINCT device_id) as count FROM vitals');
        return result.rows[0].count as number;
    }

    async calculateRollingAverage(limit: number = 100): Promise<{ thermal: number; battery: number; memory: number }> {
        const result = await this.db.execute({
            sql: `
              SELECT 
                AVG(thermal_value) as avg_thermal,
                AVG(battery_level) as avg_battery,
                AVG(memory_usage) as avg_memory
              FROM (
                SELECT thermal_value, battery_level, memory_usage
                FROM vitals
                ORDER BY timestamp DESC, created_at DESC
                LIMIT ?
              )
            `,
            args: [limit]
        });

        const row = result.rows[0];

        return {
            thermal: row.avg_thermal ? parseFloat((row.avg_thermal as number).toFixed(2)) : 0,
            battery: row.avg_battery ? parseFloat((row.avg_battery as number).toFixed(2)) : 0,
            memory: row.avg_memory ? parseFloat((row.avg_memory as number).toFixed(2)) : 0,
        };
    }

    async getTimeRange(): Promise<{ earliest: string | null; latest: string | null }> {
        const result = await this.db.execute(`
          SELECT 
            MIN(timestamp) as earliest,
            MAX(timestamp) as latest
          FROM vitals
        `);

        const row = result.rows[0];

        return {
            earliest: (row.earliest as string) || null,
            latest: (row.latest as string) || null,
        };
    }

    async getMinMax(since?: string): Promise<{
        thermal: { min: number; max: number };
        battery: { min: number; max: number };
        memory: { min: number; max: number };
    }> {
        const sql = since
            ? `SELECT 
                MIN(thermal_value) as min_thermal, MAX(thermal_value) as max_thermal,
                MIN(battery_level) as min_battery, MAX(battery_level) as max_battery,
                MIN(memory_usage) as min_memory, MAX(memory_usage) as max_memory
               FROM vitals WHERE timestamp >= ?`
            : `SELECT 
                MIN(thermal_value) as min_thermal, MAX(thermal_value) as max_thermal,
                MIN(battery_level) as min_battery, MAX(battery_level) as max_battery,
                MIN(memory_usage) as min_memory, MAX(memory_usage) as max_memory
               FROM vitals`;

        const result = await this.db.execute({
            sql,
            args: since ? [since] : []
        });

        const row = result.rows[0];

        return {
            thermal: {
                min: row.min_thermal !== null ? (row.min_thermal as number) : 0,
                max: row.max_thermal !== null ? (row.max_thermal as number) : 0
            },
            battery: {
                min: row.min_battery !== null ? (row.min_battery as number) : 0,
                max: row.max_battery !== null ? (row.max_battery as number) : 0
            },
            memory: {
                min: row.min_memory !== null ? (row.min_memory as number) : 0,
                max: row.max_memory !== null ? (row.max_memory as number) : 0
            }
        };
    }

    async deleteAll(): Promise<void> {
        await this.db.execute('DELETE FROM vitals');
    }
}