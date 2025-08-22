import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebView extends StatefulWidget {
  final String title;
  final String url;

  const WebView({super.key, required this.title, required this.url});

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebView')),
      body: SafeArea(child: Container(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(width: 200.w, height: 20.h, child: Text('返回')),
        ),
      ))
    );
  }
}