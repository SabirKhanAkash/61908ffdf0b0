# Device Vital Monitor (DVM) - Backend

Backend API for the Device Vital Monitor application, built with Node.js, Express, TypeScript and SQLite based Turso database for persistent storage. This service handles the ingestion, storage, and analysis of device vital signs such as thermal state, battery level, and memory usage.

## 🚀 Features

- **Store Vitals**: Persistent storage for device sensor data.
- **Retrieve History**: Access historical logs of device vitals.
- **Analytics**: Calculate rolling averages and provide insights into device health.
- **Device Specific Logs**: Filter logs by unique device identifiers.
- **Data Validation**: strict validation logic to ensure data integrity.
- **Health Check**: Endpoint to verify service status.

## 🛠 Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Language**: TypeScript
- **Database**: LibSQL / Turso (Compatible with SQLite)
- **Testing**: Jest

## 📋 Prerequisites

- **Node.js**: v18.0.0 or higher
- **npm**: v9.0.0 or higher

## 📦 Installation

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone https://github.com/SabirKhanAkash/61908ffdf0b0.git
   cd dvm-backend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Environment Configuration**:
   Create a `.env` file in the root directory and paste the below content:
```env
NODE_ENV=development

PORT=3000

VERCEL=0

TURSO_DATABASE_URL=libsql://vitals-db-sabirkhanakash.aws-ap-south-1.turso.io

TURSO_AUTH_TOKEN=eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJnaWQiOiI1NDAwYmFmZi1jMmI3LTQ2M2UtYjI2MC1mYTE0MDJmYmVmNjkiLCJpYXQiOjE3NjkxNTExMzAsInJpZCI6IjRiYjU1MzllLWFkMjYtNDY5Mi1iNWI4LWIzOTBmYzEwYjFhYSJ9.yvc_0u-mmE33i7dcSR5Q7ln_UwQOvzUxXrRU7M9ksRuHY-G-PONqUzr9Bd6mNtDGa_jQr3LHbA_GwQlaKfdGBw
```

## 🏃‍♂️ Running the Application

### Development Mode
Starts the server with `nodemon` for hot-reloading:
```bash
npm run dev
```

### Production Build
Build the TypeScript code and start the optimized application:
```bash
npm run build
npm start
```

The server will start at `http://localhost:3000`.
You can check the health endpoint from: `http://localhost:3000/health` (or your configured PORT).

## 🧪 Testing

Run the unit and integration tests:
```bash
npm test
```

Run tests in watch mode (useful during development):
```bash
npm run test:watch
```

## 🔌 API Endpoints

### Vitals
- **POST** `/api/vitals`
  - Submit a new vital log.
  - Body: 
  ```json
  { 
    "device_id": "string",
    "timestamp": "string",
    "thermal_value": "number",
    "battery_level": "number",
    "memory_usage": "number",
  }
  ```
- **GET** `/api/vitals`
  - Retrieve the latest 100 vital logs.
- **GET** `/api/vitals/analytics`
  - Retrieve analytics data (e.g., rolling averages).
- **GET** `/api/vitals/device/:deviceId`
  - Retrieve logs for a specific device ID.

### System
- **GET** `/health`
  - Check API status and uptime.

## 📂 Project Structure

```
dvm-backend/
├── src/
│   ├── app.ts            # Application entry point
│   ├── config/           # Configuration (Database, etc.)
│   ├── controllers/      # Route controllers
│   ├── middlewares/      # Express middlewares (Error handling, Logging)
│   ├── models/           # Data models and interfaces
│   ├── repositories/     # Data access layer
│   ├── routes/           # API route definitions
│   └── services/         # Business logic
├── tests/                # Jest test suite
├── .env.placeholder      # Environment variable template
├── package.json          # Dependencies and scripts
└── tsconfig.json         # TypeScript configuration
```
