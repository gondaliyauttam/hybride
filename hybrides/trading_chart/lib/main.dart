// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TradingViewChart(),
    );
  }
}

class TradingViewChart extends StatefulWidget {
  @override
  _TradingViewChartState createState() => _TradingViewChartState();
}

class _TradingViewChartState extends State<TradingViewChart> {
  final String _url = 'https://www.tradingview.com/chart/';
  final _webviewKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TradingView Chart'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: WebView(
          key: _webviewKey,
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
