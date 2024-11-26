import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'network_exceptions.dart';
import 'api_result.dart';


/// A helper class to manage HTTP requests via Dio.
/// Provides methods for GET, POST, PUT, and DELETE.
class NetworkHelper {
  final DioClient dioClient;

  /// Constructor to initialize with the injected DioClient instance.
  NetworkHelper({required this.dioClient});

  /// Performs a GET request.
  Future<ApiResult<T>> get<T>(String url,
      {Map<String, dynamic>? queryParameters,
        Options? options}) async {
    try {
      final response = await dioClient.dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(data: response.data);
    } on DioException catch (e) {
      return ApiResult.failure(error: NetworkExceptions.handleException(e));
    }
  }

  /// Performs a POST request.
  Future<ApiResult<T>> post<T>(String url,
      {dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options}) async {
    try {
      final response = await dioClient.dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(data: response.data);
    } on DioException catch (e) {
      return ApiResult.failure(error: NetworkExceptions.handleException(e));
    }
  }

  /// Performs a PUT request.
  Future<ApiResult<T>> put<T>(String url,
      {dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options}) async {
    try {
      final response = await dioClient.dio.put<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(data: response.data);
    } on DioException catch (e) {
      return ApiResult.failure(error: NetworkExceptions.handleException(e));
    }
  }

  /// Performs a DELETE request.
  Future<ApiResult<T>> delete<T>(String url,
      {dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options}) async {
    try {
      final response = await dioClient.dio.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(data: response.data);
    } on DioException catch (e) {
      return ApiResult.failure(error: NetworkExceptions.handleException(e));
    }
  }
}
