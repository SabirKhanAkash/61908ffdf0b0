import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo;
  String? _cachedDeviceId;

  DeviceInfoService(this._deviceInfo);

  Future<String> getDeviceId() async {
    if (_cachedDeviceId != null) return _cachedDeviceId!;

    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        _cachedDeviceId = 'android-${androidInfo.id}';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        _cachedDeviceId = 'ios-${iosInfo.identifierForVendor}';
      } else {
        _cachedDeviceId = 'unknown-${DateTime.now().millisecondsSinceEpoch}';
      }
    } catch (e) {
      _cachedDeviceId = 'error-${DateTime.now().millisecondsSinceEpoch}';
    }

    return _cachedDeviceId!;
  }
}
