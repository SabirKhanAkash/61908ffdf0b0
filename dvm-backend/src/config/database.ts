import Database from 'better-sqlite3';
import path from 'path';
import fs from 'fs';

const DB_PATH = path.join(__dirname, '../../database/vitals.db');

export function initDatabase(): Database.Database {
    const dbDir = path.dirname(DB_PATH);
    if (!fs.existsSync(dbDir)) {
        fs.mkdirSync(dbDir, { recursive: true });
    }

    const db = new Database(DB_PATH, { verbose: console.log });

    db.pragma('foreign_keys = ON');

    const createTableSQL = `
        CREATE TABLE IF NOT EXISTS vitals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            device_id TEXT NOT NULL,
            timestamp TEXT NOT NULL,
            thermal_value INTEGER NOT NULL CHECK(thermal_value >= 0 AND thermal_value <= 3),
            battery_level INTEGER NOT NULL CHECK(battery_level >= 0 AND battery_level <= 100),
            memory_usage INTEGER NOT NULL CHECK(memory_usage >= 0 AND memory_usage <= 100),
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    `;

    db.exec(createTableSQL);

    db.exec('CREATE INDEX IF NOT EXISTS idx_timestamp ON vitals(timestamp DESC)');
    db.exec('CREATE INDEX IF NOT EXISTS idx_device_id ON vitals(device_id)');
    db.exec('CREATE INDEX IF NOT EXISTS idx_created_at ON vitals(created_at DESC)');

    console.log('Successfully SQLite Database initialized...');
    return db;
}

let dbInstance: Database.Database | null = null;

export function getDatabase(): Database.Database {
    if (!dbInstance) {
        dbInstance = initDatabase();
    }
    return dbInstance;
}

export function closeDatabase(): void {
    if (dbInstance) {
        dbInstance.close();
        dbInstance = null;
        console.log('Successfully SQLite Database connection closed...');
    }
}
