# Device Vital Monitor (DVM)

## In-App Screenshots

<table>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/f6cad6ca-c9fc-4b15-9aee-4b893c903224" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/6cb1adc1-5d34-4f55-8784-43d94e1fb99f" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/8933d2c6-45d1-46a8-9daf-ad897548f03d" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/9003fb6e-63d7-4df8-a1fd-44a916ef7c28" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/dbc7c72c-0316-4dae-9ea9-f684fc31fbc6" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/f77c2c64-8fd9-4e0a-aeef-86b75d7e5f1e" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/93e985a5-9d3c-481a-b5d5-3a0edfeff703" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/8621ddc3-dbf7-41ed-ad05-b67c90fac599" width="270" height="570" alt=""/><br>
      <i></i>
    </td>
  </tr>
</table>

A Flutter application designed to monitor device sensor data (thermal state, battery level, memory usage) and log it to a backend service. This project demonstrates Flutter UI development, clean architecture, and native platform integration via MethodChannels.

## Features

- **Real-time Dashboard**: Displays current thermal status, battery level, and memory usage.
- **Vitals Logging**: Send current sensor readings to the backend API.
- **History & Analytics**: View historical logs and analyzed data trends.
- **Native Integration**:
  - **Android**: Uses `PowerManager`, `BatteryManager`, and `ActivityManager` via targeting core Android Specific Platform Channels.
  - **Thermal API**: Smart support for `getCurrentThermalStatus` (API 29+) and `getThermalHeadroom` (API < 29).
  - **Battery API**: Smart support for `BATTERY_PROPERTY_CAPACITY` (API < 29).
  - **Memory API**: Smart support for `MemoryInfo` (API < 29).

## Tech Stack

- **Flutter**: UI and cross-platform logic.
- **State Management**: Bloc / Cubit.
- **Architecture**: Clean Architecture (Presentation, Domain, Data layers).
- **Native**: Kotlin (Android).
- **Testing**: `mocktail` for unit tests.

## Prerequisites

- Flutter SDK (3.10.7 or compatible)
- Android Studio / Android SDK (for Android build)
- Xcode (for iOS build - *iOS native logic pending implementation*)

## Setup & Installation

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/SabirKhanAkash/61908ffdf0b0.git
    cd dvm_app
    ```

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

## Running the App

The application supports multiple flavors (dev, stage, prod).

## Dev
Use `dev` for local backend development.

**NOTE:** If you want to run the `dev` flavor, then first you need to run the backend server on your machine locally. So, go to 
```dvm_app\lib\core\flavors\env.dart``` 

```bash
static const dev = Env(
    flavorName: 'dev',
    baseUrl: 'http://your-local-ip-here:3000',
    enableLogging: true,
    connectionTimeout: 10,
    receiveTimeout: 10,
  );
```

and change the baseUrl to your local machine's IP address. 

```bash
[DEBUG Mode]
flutter run -t lib/main_dev.dart --flavor dev --debug

Or,

[RELEASE Mode]
flutter run -t lib/main_dev.dart --flavor dev --release
```

## Stage
```bash
[DEBUG Mode]
flutter run -t lib/main_stage.dart --flavor stage --debug

Or,

[RELEASE Mode]
flutter run -t lib/main_stage.dart --flavor stage --release
```

## Prod
```bash
[DEBUG Mode]
flutter run -t lib/main_prod.dart --flavor prod --debug

Or,

[RELEASE Mode]
flutter run -t lib/main_prod.dart --flavor prod --release
```

## Running Tests

To run the full suite of unit tests for the repository and data sources:

```bash
./run_unit_tests.sh
```
*(On Windows, you can use `bash run_unit_tests.sh` or run directly in Git Bash)*

This script executes all unit tests in the `test/` directory. 
The tests cover:
- Repository implementation
- Platform Data Source (Method Channels)
- Remote Data Source (API communication)

## Documentation

- **[DECISIONS.md](DECISIONS.md)**: Details on design choices, ambiguity handling, and trade-offs.
- **[ai_log.md](ai_log.md)**: Log of AI collaboration and key technical decisions made with assistance.

## Project Structure

```
lib/
├── core/    # Core utilities, constants, and flavor config
├── features/
│   └── vitals/     # Vitals feature (Clean Architecture)
│       ├── data/       # Repositories, Data Sources, Models
│       ├── domain/     # Entities, Use Cases, Repository Interfaces
│       └── presentation/ # BLoCs, Screens, Widgets
├── main_dev.dart   # Entry point for Dev flavor
├── main_prod.dart  # Entry point for Prod flavor
└── main_stage.dart # Entry point for Stage flavor
```

## Native Implementation Details

## Android
Implements specific thermal status logic in `MainActivity.kt`:

## For Thermal Status
- **API < 29**: Uses `PowerManager.getThermalHeadroom`.
- **API >= 29+**: Uses `PowerManager.getCurrentThermalStatus`.
- **Fallback**: Returns 0 ("None") for older devices.

## For Battery Level
- Uses `BatteryManager.BATTERY_PROPERTY_CAPACITY`.
- **Fallback**: Returns 0 ("None") for older devices.

## For Memory Usage
- Uses `ActivityManager.MemoryInfo`.
- **Fallback**: Returns 0 ("None") for older devices.

