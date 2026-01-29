import 'dart:convert';
import 'dart:io';
import 'package:dvm_app/core/constants/api_constants.dart';
import 'package:dvm_app/features/vitals/domain/data_sources/data_sources.dart';
import 'package:dvm_app/features/vitals/domain/entities/entities.dart';
import 'package:http/http.dart' as http;
import '../models/vital_analytics_model.dart';
import '../models/vital_log_model.dart';
import 'package:dvm_app/core/errors/errors.dart';
import 'package:dvm_app/core/services/device_info_service.dart';

class VitalRemoteDataSourceImpl implements VitalRemoteDataSource {
  final http.Client client;
  final DeviceInfoService deviceInfoService;

  VitalRemoteDataSourceImpl({
    required this.client,
    required this.deviceInfoService,
  });

  @override
  Future<void> postVitalLog(VitalLog log) async {
    try {
      final logModel = VitalLogModel.fromEntity(log);
      final response = await client
          .post(
            Uri.parse('${ApiConstants.baseUrl}${ApiConstants.vitalsEndpoint}'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(logModel.toJson()),
          )
          .timeout(ApiConstants.connectionTimeout);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return;
      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        throw ServerException(
          'Validation failed: ${responseData['message'] ?? 'Bad request'}',
        );
      } else if (response.statusCode >= 500) {
        throw const ServerException('Server error occurred');
      } else {
        throw ServerException('Unexpected error: ${response.statusCode}');
      }
    } on SocketException {
      throw const NetworkException('No internet connection');
    } on http.ClientException {
      throw const NetworkException('Network error occurred');
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Failed to post vital log: $e');
    }
  }

  @override
  Future<List<VitalLog>> getVitals({int limit = 100}) async {
    try {
      final deviceId = await deviceInfoService.getDeviceId();
      final response = await client
          .get(
            Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.vitalsEndpoint}?limit=$limit',
            ),
            headers: {
              'Content-Type': 'application/json',
              'x-device-id': deviceId,
            },
          )
          .timeout(ApiConstants.receiveTimeout);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final data = responseData['data'] as List;
        return data
            .map((item) => VitalLogModel.fromJson(item).toEntity())
            .toList();
      } else if (response.statusCode >= 500) {
        throw const ServerException('Server error occurred');
      } else {
        throw ServerException('Failed to fetch vitals: ${response.statusCode}');
      }
    } on SocketException {
      throw const NetworkException('No internet connection');
    } on http.ClientException {
      throw const NetworkException('Network error occurred');
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Failed to get vitals: $e');
    }
  }

  @override
  Future<VitalAnalytics> getAnalytics() async {
    try {
      final deviceId = await deviceInfoService.getDeviceId();
      final response = await client
          .get(
            Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.analyticsEndpoint}',
            ),
            headers: {
              'Content-Type': 'application/json',
              'x-device-id': deviceId,
            },
          )
          .timeout(ApiConstants.receiveTimeout);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return VitalAnalyticsModel.fromJson(responseData['data']).toEntity();
      } else if (response.statusCode >= 500) {
        throw const ServerException('Server error occurred');
      } else {
        throw ServerException(
          'Failed to fetch analytics: ${response.statusCode}',
        );
      }
    } on SocketException {
      throw const NetworkException('No internet connection');
    } on http.ClientException {
      throw const NetworkException('Network error occurred');
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Failed to get analytics: $e');
    }
  }
}
