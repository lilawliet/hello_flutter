import 'package:flutter/material.dart';
import 'package:flutter_application/app.dart';
import 'package:flutter_application/https/dio_instance.dart';

void main() {
  // 初始化 Dio
  DioInstance.getInstance().initDio(baseUrl: 'https://www.wanandroid.com/');
  // 运行应用
  runApp(const MyApp());
}
