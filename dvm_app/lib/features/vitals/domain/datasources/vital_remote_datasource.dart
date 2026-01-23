import 'package:dvm_app/features/vitals/data/models/models.dart';

/// Abstract interface for remote data source
abstract class VitalRemoteDataSource {
  /// Post a vital log to the backend
  Future<void> postVitalLog(VitalLogModel log);

  /// Get vitals history from backend
  Future<List<VitalLogModel>> getVitals({int limit = 100});

  /// Get analytics from backend
  Future<VitalAnalyticsModel> getAnalytics();
}
