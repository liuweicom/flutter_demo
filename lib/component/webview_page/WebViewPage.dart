import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: "http://ipts.zpmc.com/ids-admin/#/",
      appBar: new AppBar(
        title: const Text('Widget webview'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('等待中.....'),
        ),
      ),
    );
  }

}



