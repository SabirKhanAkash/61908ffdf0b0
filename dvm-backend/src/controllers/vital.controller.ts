import { Request, Response } from 'express';
import { VitalService } from '../services/vital.service';

export class VitalController {
    private service: VitalService;

    constructor(service: VitalService) {
        this.service = service;
    }

    createVital = async (req: Request, res: Response): Promise<void> => {
        try {
            const result = await this.service.createVitalLog(req.body);

            if (!result.success) {
                res.status(400).json({
                    success: false,
                    message: 'Validation failed',
                    errors: result.errors,
                });
                return;
            }

            res.status(201).json({
                success: true,
                message: 'Vital log created successfully',
                data: result.data,
            });
        } catch (error: any) {
            console.error('Error creating vital log:', error);
            res.status(500).json({
                success: false,
                message: 'Internal server error',
                error: error.message,
            });
        }
    };

    getVitals = async (req: Request, res: Response): Promise<void> => {
        try {
            const deviceId = req.headers['x-device-id'] as string | undefined;
            const limit = req.query.limit ? parseInt(req.query.limit as string) : 100;
            const logs = await this.service.getLatestLogs(limit, deviceId);

            res.status(200).json({
                success: true,
                count: logs.length,
                data: logs,
            });
        } catch (error: any) {
            console.error('Error fetching vital logs:', error);
            res.status(500).json({
                success: false,
                message: 'Internal server error',
                error: error.message,
            });
        }
    };

    getAnalytics = async (req: Request, res: Response): Promise<void> => {
        try {
            const deviceId = req.headers['x-device-id'] as string | undefined;
            const analytics = await this.service.getAnalytics(deviceId);

            res.status(200).json({
                success: true,
                data: analytics,
            });
        } catch (error: any) {
            console.error('Error fetching analytics:', error);
            res.status(500).json({
                success: false,
                message: 'Internal server error',
                error: error.message,
            });
        }
    };

    getDeviceVitals = async (req: Request, res: Response): Promise<void> => {
        try {
            const { deviceId } = req.params;
            const limit = req.query.limit ? parseInt(req.query.limit as string) : 100;

            const logs = await this.service.getDeviceLogs(deviceId, limit);

            res.status(200).json({
                success: true,
                device_id: deviceId,
                count: logs.length,
                data: logs,
            });
        } catch (error: any) {
            console.error('Error fetching device vitals:', error);
            res.status(500).json({
                success: false,
                message: 'Internal server error',
                error: error.message,
            });
        }
    };
}