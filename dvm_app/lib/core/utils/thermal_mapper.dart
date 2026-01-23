import 'package:dvm_app/features/vitals/domain/enums/enums.dart';

class ThermalMapper {
  static String getLabel(int thermalValue) {
    switch (thermalValue) {
      case 0:
        return 'Normal';
      case 1:
        return 'Light';
      case 2:
        return 'Moderate';
      case 3:
        return 'Severe';
      default:
        return 'Unknown';
    }
  }

  static ThermalIndicator getIndicator(int thermalValue) {
    switch (thermalValue) {
      case 0:
        return ThermalIndicator.normal;
      case 1:
        return ThermalIndicator.light;
      case 2:
        return ThermalIndicator.moderate;
      case 3:
        return ThermalIndicator.severe;
      default:
        return ThermalIndicator.unknown;
    }
  }
}
