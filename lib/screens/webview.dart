import 'package:flutter/material.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebView')),
    );
  }
}