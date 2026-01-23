import { createClient, Client } from '@libsql/client';
import path from 'path';
import fs from 'fs';
import dotenv from 'dotenv';

dotenv.config();

const IS_VERCEL = process.env.VERCEL === '1';

function getDatabaseUrl(): string {
    const tursoUrl = process.env.TURSO_DATABASE_URL;
    if (tursoUrl) return tursoUrl;

    if (IS_VERCEL) {
        return 'file:/tmp/vitals.db';
    }

    const localDbPath = path.join(__dirname, '../../database/vitals.db');
    const dbDir = path.dirname(localDbPath);
    if (!fs.existsSync(dbDir)) {
        fs.mkdirSync(dbDir, { recursive: true });
    }
    return `file:${localDbPath}`;
}

export async function initDatabase(): Promise<Client> {
    const url = getDatabaseUrl();
    const authToken = process.env.TURSO_AUTH_TOKEN;

    const db = createClient({
        url: url,
        authToken: authToken,
    });

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

    await db.execute(createTableSQL);

    await db.execute('CREATE INDEX IF NOT EXISTS idx_timestamp ON vitals(timestamp DESC)');
    await db.execute('CREATE INDEX IF NOT EXISTS idx_device_id ON vitals(device_id)');
    await db.execute('CREATE INDEX IF NOT EXISTS idx_created_at ON vitals(created_at DESC)');

    console.log(`Successfully Database initialized at ${url}...`);
    return db;
}

let dbInstance: Client | null = null;

export async function getDatabase(): Promise<Client> {
    if (!dbInstance) {
        dbInstance = await initDatabase();
    }
    return dbInstance;
}

export function closeDatabase(): void {
    if (dbInstance) {
        dbInstance.close();
        dbInstance = null;
        console.log('Successfully Database connection closed...');
    }
}
