class ServerException implements Exception {
  final String? message;
  const ServerException([this.message]);

  @override
  String toString() => message ?? 'ServerException';
}

class NetworkException implements Exception {
  final String? message;
  const NetworkException([this.message]);

  @override
  String toString() => message ?? 'NetworkException';
}

class CacheException implements Exception {}
