import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let vitalChannel = FlutterMethodChannel(name: "com.optimizely.vitals/sensors",
                                              binaryMessenger: controller.binaryMessenger)
    
    vitalChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "getSensorData" {
        result(self.getSensorData())
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getSensorData() -> [String: Any] {
    return [
      "thermal_value": getThermalStatus(),
      "battery_level": getBatteryLevel(),
      "memory_usage": getMemoryUsage()
    ]
  }

  private func getThermalStatus() -> Int {
    let state = ProcessInfo.processInfo.thermalState
    switch state {
    case .nominal:
        return 0
    case .fair:
        return 1
    case .serious:
        return 2
    case .critical:
        return 3
    @unknown default:
        return 0
    }
  }

  private func getBatteryLevel() -> Double {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryLevel < 0 {
        return 0.0
    }
    return Double(device.batteryLevel * 100)
  }

  private func getMemoryUsage() -> Double {
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4
    let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
        }
    }

    if kerr == KERN_SUCCESS {
        let usedMemory = Float(taskInfo.resident_size)
        let totalMemory = Float(ProcessInfo.processInfo.physicalMemory)
        return Double((usedMemory / totalMemory) * 100.0)
    } else {
        return 0.0
    }
  }
}

