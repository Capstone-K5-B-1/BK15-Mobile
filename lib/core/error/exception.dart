abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException(super.message, [super.statusCode]);
}

class ServerException extends AppException {
  const ServerException(super.message, [super.statusCode]);
}

class CacheException extends AppException {
  const CacheException(super.message);
}

class ValidationException extends AppException {
  const ValidationException(super.message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([String? message])
    : super(message ?? 'Unauthorized access', 401);
}

class NotFoundException extends AppException {
  const NotFoundException([String? message])
    : super(message ?? 'Resource not found', 404);
}

class TimeoutException extends AppException {
  const TimeoutException([String? message])
    : super(message ?? 'Request timeout');
}
