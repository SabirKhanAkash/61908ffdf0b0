import express, { Application } from 'express';
import cors from 'cors';
import { getDatabase } from './config/database';
import { VitalRepository } from './repositories/vital.repository';
import { VitalService } from './services/vital.service';
import { VitalController } from './controllers/vital.controller';
import { createVitalRoutes } from './routes/vital.route';
import { errorHandler, notFoundHandler, requestLogger } from './middlewares/error.middleware';

const PORT = process.env.PORT || 3000;

function createApp(): Application {
    const app = express();

    /// Middleware
    app.use(cors());
    app.use(express.json());
    app.use(requestLogger);

    /// Initialize database and dependencies
    const db = getDatabase();
    const repository = new VitalRepository(db);
    const service = new VitalService(repository);
    const controller = new VitalController(service);

    /// Health check endpoint
    app.get('/health', (req, res) => {
        res.json({
            status: 'ok',
            timestamp: new Date().toISOString(),
            uptime: process.uptime(),
        });
    });

    /// API routes
    app.use('/api', createVitalRoutes(controller));

    /// Error handling
    app.use(notFoundHandler);
    app.use(errorHandler);

    return app;
}

/// Start the server
function startServer(): void {
    const app = createApp();

    const server = app.listen(PORT, () => {
        console.log('=================================');
        console.log('🚀 Device Vital Monitor (DVM) API');
        console.log('=================================');
        console.log(`Server running on port ${PORT}`);
        console.log('=================================');
    });

    /// Graceful shutdown
    process.on('SIGTERM', () => {
        console.log('SIGTERM signal received: closing HTTP server');
        server.close(() => {
            console.log('HTTP server closed');
            process.exit(0);
        });
    });

    process.on('SIGINT', () => {
        console.log('\nSIGINT signal received: closing HTTP server');
        server.close(() => {
            console.log('HTTP server closed');
            process.exit(0);
        });
    });
}

/// Start server if this file is run directly
if (require.main === module) {
    startServer();
}

export { createApp };