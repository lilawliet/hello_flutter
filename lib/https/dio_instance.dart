import 'package:dio/dio.dart';
import 'package:flutter_application/https/log_interceptor.dart';
import 'package:flutter_application/https/methods.dart';
import 'package:flutter_application/https/resp_interceptor.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance getInstance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final _defaultTime = const Duration(seconds: 30);

  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      method: httpMethod,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? _defaultTime,
      receiveTimeout: receiveTimeout ?? _defaultTime,
      sendTimeout: sendTimeout ?? _defaultTime,
    );

    _dio.interceptors.add(MyLogInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
  }

  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.get(
      url,
      queryParameters: queryParameters,
      options:
          options ??
          Options(
            method: HttpMethod.GET,
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime,
          ),
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> post<T>(
    String url, {
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.post(
      url,
      data: data,
      options:
          options ??
          Options(
            method: HttpMethod.POST,
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime,
          ),
      cancelToken: cancelToken,
    );
  }
}
