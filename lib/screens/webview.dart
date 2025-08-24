import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebView extends StatefulWidget {
  final String title;

  const WebView({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  String title = '';

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var mModalRoute = ModalRoute.of(context);
      var mArguments = mModalRoute?.settings.arguments;
      if (mArguments != null && mArguments is Map) {
        title = mArguments['title'] as String;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(width: 200.w, height: 20.h, child: Text('返回')),
          ),
        ),
      ),
    );
  }
}
