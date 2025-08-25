import 'package:dio/dio.dart';
import 'dart:developer';

class MyLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("\nrequest ---------------------->");
    log("url: ${options.uri}");
    log("method: ${options.method}");
    log("headers: ${options.headers}");
    log("data: ${options.data}");
    log("queryParameters: ${options.queryParameters.toString()}");
    log("responseType: ${options.responseType}");
    log("<---------------------->\n");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("\nresponse ---------------------->");
    log("url: ${response.requestOptions.uri}");
    log("statusCode: ${response.statusCode}");
    log("data: ${response.data}");
    log("<---------------------->\n");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("\nerror ---------------------->");
    log("error: ${err.toString()}");
    log("error: ${err.response?.data}");
    log("<---------------------->\n");
    super.onError(err, handler);
  }
}
