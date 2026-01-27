# AI Collaboration Log

This log documents key promptings, AI generated results, my changes, and reasonings.

## Collaboration Highlights

### 1. Segregation of Abstraction and Implementation layer

**Prompt**: 
```text
Generate the project structure blueprint for clean architecture with data, domain and presentation layers.
```

**Result**: 
```text
┌─────────────────────────────────────┐
│     Presentation Layer              │
│  (Screens, Widgets, BLoCs/Cubits)  │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│      Domain Layer (Optional)        │
│        (Business Entities)          │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│        Data Layer                   │
│  (Models, Repositories, DataSources)│
└──────────────┬──────────────────────┘
               │
         ┌─────┴─────┐
         │           │
┌────────▼───┐  ┌────▼──────────┐
│  Platform  │  │   Remote API  │
│  Channel   │  │   (Backend)   │
└────────────┘  └───────────────┘
```
**My Changes**: 
```text
I saw AI generated domain layer only containing the entities, 
but so far i know about clean architecture, domain layers contains abstract use cases, methods repository type of thing and in the data layer the implementation of these abstract classes.
```

**Why it works**: 
```text
Because now the blueprint is clear and it shows the actual relationship between the layers.

┌─────────────────────────────────────────┐
│      Presentation Layer                 │
│   (Screens, Widgets, Cubits)           │
│   - Depends on Domain                   │
└──────────────┬──────────────────────────┘
               │
               ↓ (depends on)
┌──────────────────────────────────────────┐
│         Domain Layer                     │
│   (Entities, Repository Interfaces,     │
│    UseCases) - Pure Dart, No Flutter    │
│   - INDEPENDENT (No dependencies)        │
└──────────────┬──────────────────────────┘
               ↑ (implements)
               │
┌──────────────────────────────────────────┐
│          Data Layer                      │
│   (Models, Repository Impl, DataSources)│
│   - Depends on Domain                    │
└──────────────┬──────────────────────────┘
               │
         ┌─────┴─────┐
         ↓           ↓
    Platform      Remote API
```
---
### 2. Vital Log Entity and Model Boilerplate Code Generation

**Prompt**: 
```text
[api-response-here]
@vital_log.dart // for domain layer
@vital_log_model.dart // for data layer

generate these two files, Migrate to Freezed - I will update all files
```

**Result**:
```dart 
/// vital_log.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_log.freezed.dart';

@freezed
sealed class VitalLog with _$VitalLog {
  const factory VitalLog({
    @Default(0) int id,
    @Default('') String deviceId,
    required DateTime timestamp,
    @Default(0) int thermalValue,
    @Default(0.0) double batteryLevel,
    @Default(0.0) double memoryUsage,
  }) = _VitalLog;
}

/// vital_log_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vital_log.dart';

part 'vital_log_model.freezed.dart';
part 'vital_log_model.g.dart';

@freezed
sealed class VitalLogModel with _$VitalLogModel {
  const VitalLogModel._();

  const factory VitalLogModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'timestamp') required DateTime timestamp,
    @JsonKey(name: 'thermal_value') required int thermalValue,
    @JsonKey(name: 'battery_level') required double batteryLevel,
    @JsonKey(name: 'memory_usage') required double memoryUsage,
  }) = _VitalLogModel;

  factory VitalLogModel.fromJson(Map<String, dynamic> json) =>
      _$VitalLogModelFromJson(json);

  // Convert to domain entity
  VitalLog toEntity() {
    return VitalLog(
      id: id,
      deviceId: deviceId,
      timestamp: timestamp,
      thermalValue: thermalValue,
      batteryLevel: batteryLevel,
      memoryUsage: memoryUsage,
    );
  }

  // Convert to data model
  factory VitalLogModel.fromEntity(VitalLog entity) {
    return VitalLogModel(
      id: entity.id,
      deviceId: entity.deviceId,
      timestamp: entity.timestamp,
      thermalValue: entity.thermalValue,
      batteryLevel: entity.batteryLevel,
      memoryUsage: entity.memoryUsage,
    );
  }
}
```

**My Changes**: 
```text
At first it did not included the toEntity() and fromEntity() methods. I added them. as these are required for the data model to convert to and from the domain entity.
```

**Why it works**: 
```text
It works because the data model is responsible for converting the raw data from the platform channel into a clean domain entity, and vice versa. This ensures that the UI layer only deals with clean data, not raw platform maps. 

The reason behind using these models as freezed models is to make the code more maintainable and to reduce the amount of boilerplate code.

This AI assistance actually accelerated the development process by providing the boilerplate code.
```
---

### 3. Handling lower API Level Thermal Status

**Prompt**:
```text
Use PowerManager.getCurrentThermalStatus() (API 29+) or PowerManager.getThermalHeadroom() for older versions to write me a platform channel method in Kotlin to get the thermal status.
```

**Result**:
```kotlin
private fun getThermalStatus(): Int {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager
            return when (powerManager.currentThermalStatus) {
                PowerManager.THERMAL_STATUS_NONE -> 0
                PowerManager.THERMAL_STATUS_LIGHT -> 1
                PowerManager.THERMAL_STATUS_MODERATE -> 2
                PowerManager.THERMAL_STATUS_SEVERE,
                PowerManager.THERMAL_STATUS_CRITICAL,
                PowerManager.THERMAL_STATUS_EMERGENCY,
                PowerManager.THERMAL_STATUS_SHUTDOWN -> 3
                else -> 0
            }
        }
        return 0
    }
```

**My Changes**:
I saw that it did not handled the case for API level below 29. So I changed the code
```kotlin
private fun getThermalStatus(): Int {
    /// first I initialized the power manager object
    val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager

        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            /// then I checked if the API level is 29 or above
            when (powerManager.currentThermalStatus) {
                /// then I checked the thermal status
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
            /// then I checked if the API level is above 24 and below 29
            try {
                /// then I initialized the headroom variable
                val headroom = powerManager.getThermalHeadroom(0)
                /// then I checked the headroom value
                when {
                    headroom >= 0.8f -> 0
                    headroom >= 0.5f -> 1
                    headroom >= 0.2f -> 2
                    else -> 3
                }
            } catch (e: Exception) {
                /// then I returned 0 if there was an exception
                0
            }
        } else {
            /// then I returned 0 if the API level is below 24
            0
        }
    }
```

**Why it works**: 
```text
It works because it handles the both cases for API level below 29 and above 29.
```
 