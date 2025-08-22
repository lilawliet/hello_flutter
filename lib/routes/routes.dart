import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home.dart';
import 'package:flutter_application/screens/webview.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage(title: '首页'), settings: settings);
      case RoutePath.webview:
        return pageRoute(WebView(title: 'webview',), settings: settings);
    }

    return pageRoute(Scaffold(body: SafeArea(child: Center(child: Text('404, 路由${settings.name}不存在')))));
  }

  static MaterialPageRoute pageRoute(Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {

    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

// 路由地址
class RoutePath {
  // 首页
  static const String home = '/home';
  // webview
  static const String webview = '/webview';
}