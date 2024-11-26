import 'package:dio/dio.dart';

/// Custom Dio interceptor for logging, error handling, and token management.
class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Logging the request
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    print("Headers: ${options.headers}");
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    if (options.queryParameters.isNotEmpty) {
      print("Query Parameters: ${options.queryParameters}");
    }

    // Modify the headers if needed, e.g., add an authorization token
    options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE'; // Replace or make dynamic

    // Continue to the next step in the interceptor chain
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Logging the response
    print("RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    print("Data: ${response.data}");

    // Perform any additional processing of the response if needed

    // Continue to the next step in the interceptor chain
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Logging the error
    print("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    print("Message: ${err.message}");
    if (err.response?.data != null) {
      print("Error Data: ${err.response?.data}");
    }

    // Handle token expiration (example)
    if (err.response?.statusCode == 401) {
      print("Unauthorized! Consider refreshing the token or logging out.");
      // You could initiate a token refresh or logout mechanism here
    }

    // Continue to the next step in the interceptor chain
    handler.next(err);
  }
}
