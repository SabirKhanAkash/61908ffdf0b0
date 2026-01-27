package com.optimizely.dvm

import android.app.ActivityManager
import android.content.Context
import android.os.BatteryManager
import android.os.Build
import android.os.PowerManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.optimizely.vitals/sensors"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getSensorData") {
                val sensorData = getSensorData()
                result.success(sensorData)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getSensorData(): Map<String, Any> {
        return mapOf(
            "thermal_value" to getThermalStatus(),
            "battery_level" to getBatteryLevel(),
            "memory_usage" to getMemoryUsage()
        )
    }

    private fun getThermalStatus(): Int {
    val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager

        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            when (powerManager.currentThermalStatus) {
                PowerManager.THERMAL_STATUS_NONE -> 0
                PowerManager.THERMAL_STATUS_LIGHT -> 1
                PowerManager.THERMAL_STATUS_MODERATE -> 2
                PowerManager.THERMAL_STATUS_SEVERE,
                PowerManager.THERMAL_STATUS_CRITICAL,
                PowerManager.THERMAL_STATUS_EMERGENCY,
                PowerManager.THERMAL_STATUS_SHUTDOWN -> 3
                else -> 0
            }
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            try {
                val headroom = powerManager.getThermalHeadroom(0)
                when {
                    headroom >= 0.8f -> 0
                    headroom >= 0.5f -> 1
                    headroom >= 0.2f -> 2
                    else -> 3
                }
            } catch (e: Exception) {
                0
            }
        } else {
            0
        }
    }

    private fun getBatteryLevel(): Double {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        val level = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        return level.toDouble()
    }

    private fun getMemoryUsage(): Double {
        val activityManager = getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val memoryInfo = ActivityManager.MemoryInfo()
        activityManager.getMemoryInfo(memoryInfo)
        
        val totalMem = memoryInfo.totalMem
        val availMem = memoryInfo.availMem
        
        return if (totalMem > 0) {
            ((totalMem - availMem).toDouble() / totalMem.toDouble()) * 100.0
        } else {
            0.0
        }
    }
}
