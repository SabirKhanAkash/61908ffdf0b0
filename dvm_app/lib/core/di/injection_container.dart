import 'package:dvm_app/features/vitals/data/datasources/datasources.dart';
import 'package:dvm_app/features/vitals/data/repositories/repositories.dart';
import 'package:dvm_app/features/vitals/domain/datasources/datasources.dart';
import 'package:dvm_app/features/vitals/domain/repositories/repositories.dart';
import 'package:dvm_app/features/vitals/domain/use_cases/usecases.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/sensor/sensor_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory(() => SensorCubit(getSensorData: sl()));

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
    () => VitalRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<VitalPlatformDataSource>(
    () => VitalPlatformDataSourceImpl(),
  );

  sl.registerLazySingleton(() => http.Client());
}
