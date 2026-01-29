import 'package:dvm_app/features/vitals/data/data_sources_impl/data_sources_impl.dart';
import 'package:dvm_app/features/vitals/data/repositories_impl/repositories_impl.dart';
import 'package:dvm_app/features/vitals/domain/data_sources/data_sources.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';
import 'package:dvm_app/features/vitals/domain/use_cases/usecases.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/sensor/sensor_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dvm_app/core/services/device_info_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory(() => SensorCubit(useCase: sl()));

  sl.registerFactory(
    () => VitalsCubit(postVitalLog: sl(), getVitalsHistory: sl()),
  );

  sl.registerFactory(() => AnalyticsCubit(usecase: sl()));

  sl.registerLazySingleton(() => GetSensorDataUseCase(sl()));
  sl.registerLazySingleton(() => PostVitalLogUseCase(sl()));
  sl.registerLazySingleton(() => GetVitalsHistoryUseCase(sl()));
  sl.registerLazySingleton(() => GetAnalyticsUseCase(sl()));

  sl.registerLazySingleton<VitalRepository>(
    () => VitalRepositoryImpl(remoteDataSource: sl(), platformDataSource: sl()),
  );

  sl.registerLazySingleton<VitalRemoteDataSource>(
    () => VitalRemoteDataSourceImpl(client: sl(), deviceInfoService: sl()),
  );

  sl.registerLazySingleton<VitalPlatformDataSource>(
    () => VitalPlatformDataSourceImpl(),
  );

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => DeviceInfoPlugin());
  sl.registerLazySingleton(() => DeviceInfoService(sl()));
}
