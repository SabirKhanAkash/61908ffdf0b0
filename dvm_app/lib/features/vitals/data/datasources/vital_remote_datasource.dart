import 'dart:convert';
import 'dart:io';
import 'package:dvm_app/core/constants/api_constants.dart';
import 'package:dvm_app/features/vitals/domain/datasources/datasources.dart';
import 'package:http/http.dart' as http;
import '../models/vital_analytics_model.dart';
import '../models/vital_log_model.dart';

/// Implementation of VitalRemoteDataSource using HTTP
class VitalRemoteDataSourceImpl implements VitalRemoteDataSource {
  final http.Client client;

  VitalRemoteDataSourceImpl({required this.client});

  @override
  Future<void> postVitalLog(VitalLogModel log) async {
    try {
      final response = await client
          .post(
            Uri.parse('${ApiConstants.baseUrl}${ApiConstants.vitalsEndpoint}'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(log.toJson()),
          )
          .timeout(ApiConstants.connectionTimeout);

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Success
        return;
      } else if (response.statusCode == 400) {
        // Validation error
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
  Future<List<VitalLogModel>> getVitals({int limit = 100}) async {
    try {
      final response = await client
          .get(
            Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.vitalsEndpoint}?limit=$limit',
            ),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(ApiConstants.receiveTimeout);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final data = responseData['data'] as List;
        return data.map((item) => VitalLogModel.fromJson(item)).toList();
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
  Future<VitalAnalyticsModel> getAnalytics() async {
    try {
      final response = await client
          .get(
            Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.analyticsEndpoint}',
            ),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(ApiConstants.receiveTimeout);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return VitalAnalyticsModel.fromJson(responseData['data']);
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
