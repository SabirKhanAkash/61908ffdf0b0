# AI Collaboration Log

This log documents key promptings, AI generated results, my changes, and reasonings.

## Collaboration Highlights

### 1. Choosing Persistent Storage for Database

**Prompt**: 
```text
lets go with SQLite,

now lets focus on the backend architecture
```

**Result**: 
```text
Request Flow:
┌─────────────┐
│   Client    │
└──────┬──────┘
       │
┌──────▼──────────┐
│    Routes       │  (Endpoint definitions)
└──────┬──────────┘
       │
┌──────▼──────────┐
│  Controllers    │  (Request/Response, HTTP logic)
└──────┬──────────┘
       │
┌──────▼──────────┐
│   Services      │  (Business logic, validation, analytics)
└──────┬──────────┘
       │
┌──────▼──────────┐
│  Repositories   │  (Database operations)
└──────┬──────────┘
       │
┌──────▼──────────┐
│    SQLite DB    │
└─────────────────┘
```

**My Changes**: 
```text
First I used raw better-sqlite3 npm package, but then I found turso which is a cloud-hosted SQLite experience (LibSQL), combining the ease of SQLite with the power of a distributed persistent database.
```

**Why it works**: 
```text
Turso provides a cloud-hosted SQLite experience (LibSQL), combining the ease of SQLite with the power of a distributed persistent database.
```

---

### 2. Generating Boilerplate Models

**Prompt**: 
```text
Generate vital.model.ts according to the assignments json schema.
```

**Result**:
```typescript
// models/vital.model.ts
export interface VitalLog {
  id?: number;
  device_id: string;
  timestamp: string;  // ISO8601
  thermal_value: number;  // 0-3
  battery_level: number;  // 0-100
  memory_usage: number;   // 0-100
}

export interface VitalAnalytics {
  rolling_average: {
    thermal: number;
    battery: number;
    memory: number;
  };
  total_logs: number;
  latest_timestamp: string;
  // Add more analytics as needed
}

/// ... more interfaces as needed
```

**My Changes**: 
```text
I added some more interfaces as needed such as MinMaxValues, ValidationError, also added some fields in VitalLogAnalytics interface such as time_range, total_logs etc.
```

**Why it works**: 
```text
It worked because It was just adding more functionality and infos to the API responses.
```

