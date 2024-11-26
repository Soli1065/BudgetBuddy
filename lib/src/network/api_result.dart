import 'network_exceptions.dart';

/// A sealed class to represent the result of an API call.
/// Either it is a success containing data or a failure containing an error.
class ApiResult<T> {
  final T? data;
  final NetworkExceptions? error;

  /// Private constructor to create an instance of ApiResult.
  ApiResult._({this.data, this.error});

  /// Factory constructor for success response.
  factory ApiResult.success({T? data}) {
    return ApiResult._(data: data);
  }

  /// Factory constructor for failure response.
  factory ApiResult.failure({NetworkExceptions? error}) {
    return ApiResult._(error: error);
  }

  /// Checks if the result is a success.
  bool get isSuccess => data != null;

  /// Checks if the result is a failure.
  bool get isFailure => error != null;
}
