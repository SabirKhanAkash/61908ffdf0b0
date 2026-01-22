import { Router } from "express";
import { VitalController } from "../controllers/vital.controller";

export function createVitalRoutes(controller: VitalController): Router {
    const router = Router();

    /// Create a new vital log
    router.post('/vitals', controller.createVital);

    /// Get latest vital logs
    router.get('/vitals', controller.getVitals);

    /// Get analytics
    router.get('/vitals/analytics', controller.getAnalytics);

    /// Get logs for specific device
    router.get('/vitals/device/:deviceId', controller.getDeviceVitals);

    return router;
}