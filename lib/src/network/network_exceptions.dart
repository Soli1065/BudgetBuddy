import 'package:dio/dio.dart';

/// Centralized class for handling and categorizing network exceptions.
class NetworkExceptions implements Exception {
  final String message;

  NetworkExceptions(this.message);

  /// Factory method to handle Dio exceptions and return appropriate messages.
  static NetworkExceptions handleException(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return NetworkExceptions("Connection timeout. Please try again.");
        case DioExceptionType.sendTimeout:
          return NetworkExceptions("Send timeout. Please try again.");
        case DioExceptionType.receiveTimeout:
          return NetworkExceptions("Receive timeout. Please try again.");
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response?.statusCode);
        case DioExceptionType.cancel:
          return NetworkExceptions("Request was cancelled.");
        case DioExceptionType.unknown:
          return NetworkExceptions("An unexpected error occurred: ${error.message}");
        default:
          return NetworkExceptions("An unexpected error occurred.");
      }
    } else {
      return NetworkExceptions("An unexpected error occurred.");
    }
  }

  /// Private helper to process status codes for bad responses.
  static NetworkExceptions _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return NetworkExceptions("Bad request. Please check your input.");
      case 401:
        return NetworkExceptions("Unauthorized. Please log in again.");
      case 403:
        return NetworkExceptions("Forbidden. Access denied.");
      case 404:
        return NetworkExceptions("Not found. The resource does not exist.");
      case 500:
        return NetworkExceptions("Server error. Please try again later.");
      default:
        return NetworkExceptions("Received invalid status code: $statusCode");
    }
  }

  @override
  String toString() => message;
}
