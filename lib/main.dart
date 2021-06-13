import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUIS SafeApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = "https://docs.google.com/forms/d/e/1FAIpQLSfRULF_wt3AfwrhkB0wivuRCdcbIYOkl7ETidQFX6SI1J3O0w/viewform"
          ..style.border = 'none');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: kIsWeb
          ? Container(
              // width: MediaQuery.of(context).size.width * 0.5,
              // height: 300,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  // width: 640,
                  // height: 360,
                  child: HtmlElementView(viewType: 'hello-world-html'),
                ),
              ),
            )
          : WebView(
              gestureNavigationEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'https://docs.google.com/forms/d/e/1FAIpQLSfRULF_wt3AfwrhkB0wivuRCdcbIYOkl7ETidQFX6SI1J3O0w/viewform',
            ),
    );
  }
}
