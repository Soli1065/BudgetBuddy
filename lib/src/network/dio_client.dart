import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_interceptors.dart';


final dioClientProvider = Provider<DioClient>((ref){
  return DioClient();
});

/// This class provides a configured Dio instance
/// with reusable methods for HTTP requests (GET, POST, etc.).
class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    // Configure Dio options
    _dio.options
      ..baseUrl = "https://api.example.com" // Replace with your base URL
      ..connectTimeout = const Duration(milliseconds: 5000) // Connection timeout
      ..receiveTimeout = const Duration(milliseconds: 5000) // Response timeout
      ..headers = {
        'Content-Type': 'application/json', // Default headers for all requests
        'Accept': 'application/json',
      };

    // Add custom interceptors for logging, token handling, etc.
    _dio.interceptors.add(DioInterceptors());
  }

  // Getter to access Dio instance
  Dio get dio => _dio;

  /// Performs a GET request
  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      return await _dio.get(url, queryParameters: queryParameters, options: options);
    } catch (error) {
      rethrow; // Pass errors up the chain to handle elsewhere
    }
  }

  /// Performs a POST request
  Future<Response> post(
      String url, {
        dynamic data,
        Options? options,
      }) async {
    try {
      return await _dio.post(url, data: data, options: options);
    } catch (error) {
      rethrow; // Pass errors up the chain to handle elsewhere
    }
  }

  /// Performs a PUT request
  Future<Response> put(
      String url, {
        dynamic data,
        Options? options,
      }) async {
    try {
      return await _dio.put(url, data: data, options: options);
    } catch (error) {
      rethrow; // Pass errors up the chain to handle elsewhere
    }
  }

  /// Performs a DELETE request
  Future<Response> delete(
      String url, {
        dynamic data,
        Options? options,
      }) async {
    try {
      return await _dio.delete(url, data: data, options: options);
    } catch (error) {
      rethrow; // Pass errors up the chain to handle elsewhere
    }
  }
}
