import 'package:dio/dio.dart';
import 'package:flutter_application/https/base_model.dart';
import 'package:oktoast/oktoast.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      try {
        BaseModel baseModel = BaseModel.fromJson(response.data);

        // errorCode = 0 正常
        // errorCode = -1001 登录过期
        if (baseModel.errorCode == 0) {
          if (baseModel.data == null) {
            handler.next(
              Response(
                requestOptions: response.requestOptions,
                data: true,
                statusCode: 200,
              ),
            );
          } else {
            handler.next(
              Response(
                requestOptions: response.requestOptions,
                data: baseModel.data,
                statusCode: 200,
              ),
            );
          }
        } else if (baseModel.errorCode == -1001) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              message: '登录过期',
            ),
          );
          showToast('登录过期');
        } else {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              message: baseModel.errorMsg ?? '未知错误',
            ),
          );
        }
      } catch (e) {
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } else {
      // 如果状态码不是200，直接传递给下一个拦截器
      handler.next(response);
    }
  }
}
