import Database from 'better-sqlite3';
import { VitalLog, VitalLogInput } from '../models/vital.model';

export class VitalRepository {
    private db: Database.Database;

    constructor(database: Database.Database) {
        this.db = database;
    }

    create(vital: VitalLogInput): VitalLog {
        const stmt = this.db.prepare(`
            INSERT INTO vitals (device_id, timestamp, thermal_value, battery_level, memory_usage)
            VALUES (?, ?, ?, ?, ?)
        `);
        const result = stmt.run(
            vital.device_id,
            vital.timestamp,
            vital.thermal_value,
            vital.battery_level,
            vital.memory_usage
        );
        const created = this.db.prepare(`
            SELECT * FROM vitals WHERE id = ?
        `).get(result.lastInsertRowid) as VitalLog;
        return created;
    }

    getLatest(limit: number = 100): VitalLog[] {
        const stmt = this.db.prepare(`
            SELECT * FROM vitals ORDER BY timestamp DESC, created_at DESC
            LIMIT ?
        `);
        return stmt.all(limit) as VitalLog[];
    }

    getAll(): VitalLog[] {
        const stmt = this.db.prepare(`
            SELECT * FROM vitals ORDER BY timestamp DESC
        `);
        return stmt.all() as VitalLog[];
    }

    getByDeviceId(deviceId: string, limit: number = 100): VitalLog[] {
        const stmt = this.db.prepare(`
            SELECT * FROM vitals 
            WHERE device_id = ?
            ORDER BY timestamp DESC
            LIMIT ?
        `);
        return stmt.all(deviceId, limit) as VitalLog[];
    }

    count(): number {
        const result = this.db.prepare('SELECT COUNT(*) as count FROM vitals').get() as { count: number };
        return result.count;
    }

    countDevices(): number {
        const result = this.db.prepare('SELECT COUNT(DISTINCT device_id) as count FROM vitals').get() as { count: number };
        return result.count;
    }

    calculateRollingAverage(limit: number = 100): { thermal: number; battery: number; memory: number } {
        const stmt = this.db.prepare(`
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
    `);

        const result = stmt.get(limit) as any;

        return {
            thermal: result.avg_thermal ? parseFloat(result.avg_thermal.toFixed(2)) : 0,
            battery: result.avg_battery ? parseFloat(result.avg_battery.toFixed(2)) : 0,
            memory: result.avg_memory ? parseFloat(result.avg_memory.toFixed(2)) : 0,
        };
    }

    getTimeRange(): { earliest: string | null; latest: string | null } {
        const result = this.db.prepare(`
      SELECT 
        MIN(timestamp) as earliest,
        MAX(timestamp) as latest
      FROM vitals
    `).get() as any;

        return {
            earliest: result.earliest,
            latest: result.latest,
        };
    }

    deleteAll(): void {
        this.db.prepare('DELETE FROM vitals').run();
    }
}