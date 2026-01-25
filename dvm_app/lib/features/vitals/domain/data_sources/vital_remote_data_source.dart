import 'package:dvm_app/features/vitals/domain/entities/entities.dart';

abstract class VitalRemoteDataSource {
  Future<void> postVitalLog(VitalLog log);

  Future<List<VitalLog>> getVitals({int limit = 100});

  Future<VitalAnalytics> getAnalytics();
}
