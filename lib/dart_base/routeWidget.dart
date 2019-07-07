import 'package:flutter/material.dart';
import "package:flutter_demo/dart_base/lessWidget.dart";
import "package:flutter_demo/dart_base/fullWidget.dart";
import "package:flutter_demo/dart_base/flutter_layout_page.dart";
import 'package:flutter_demo/dart_base/PhotoApp.dart';
import 'package:flutter_demo/dart_base/PhotoPage.dart';
import 'package:flutter_demo/dart_base/AnimationPage.dart';
import 'package:flutter_demo/dart_base/AnimationWidget.dart';
import 'package:flutter_demo/dart_base/AnimationPageBuilder.dart';
import 'package:flutter_demo/component/tabbar_page.dart';
import 'package:flutter_demo/component/http_page/HttpPage.dart';
import 'package:flutter_demo/component/http_page/http_fetureBuilder_page.dart';
import 'package:flutter_demo/component/listView/listView_page.dart';
import 'package:flutter_demo/component/listView/gridView_page.dart';
import 'package:flutter_demo/component/http_page/count_page.dart';
import 'package:flutter_demo/component/webview_page/WebViewPage.dart';

class routeWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RouteNavigator(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => lessWidget(),
        "full": (BuildContext context) => fullWidget(),
        "layout": (BuildContext context) => flutterLayoutPage(),
        "photo": (BuildContext context) => PhotoApp(),
        "iamge": (BuildContext context) => PhotoPage(),
        "animation": (BuildContext context) => AnimationPage(),
        "animatedWidget": (BuildContext context) => AnimationPageWidget(),
        "animatedBuilder": (BuildContext context) => AnimationPageBuilder(),
        "tabbar": (BuildContext context) => TabbarPage(),
        "http": (BuildContext context) => HttpPage(),
        "fetureBuilder": (BuildContext context) => FetureBuilderPage(),
        "listView": (BuildContext context) => ListViewPage(),
        "gridViewPage": (BuildContext context) => GradeViewPage(),
        "coutpage": (BuildContext context) => CountPage(),
        "webView": (BuildContext context) => WebViewPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  RouteNavigator({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('${byName? "": "不"}通过路由跳转'),
              value: byName,
              onChanged: (value){
                setState(() {
                  byName = value;
                });
              },
            ),
            _item("StaleLessWidget与基础组件", lessWidget(), 'less'),
            _item("StateFulWidget和其中常用组件", fullWidget(), 'full'),
            _item("常用基本布局组件", flutterLayoutPage(), 'layout'),
            _item("拍照APP", PhotoApp(), 'photo'),
            _item("图片控件开发", PhotoPage(), 'iamge'),
            _item("动画", AnimationPage(), 'animation'),
            _item("动画withAnimatedWidget", AnimationPageWidget(), 'animatedWidget'),
            _item("动画withAnimatedBuilder", AnimationPageBuilder(), 'animatedBuilder'),
            _item("头部tabBar", TabbarPage(), 'tabbar'),
            _item("基于Http实现网络操作", HttpPage(), 'http'),
            _item("基于FetureBuilder实现http", FetureBuilderPage(), 'fetureBuilder'),
            _item("ListView实现下拉刷新上拉加载", ListViewPage(), 'listView'),
            _item("GriderView基本布局", GradeViewPage(), 'gridViewPage'),
            _item("基于sharedPreference实现count计数", CountPage(), 'coutpage'),
            _item("基于webView的引用", WebViewPage(), 'webView'),
          ],
        ),
      ),
    );
  }

  _item(String s, Widget widget, String t) {
    return Container(
      child: RaisedButton(
          onPressed: () {
            if(byName){
              Navigator.pushNamed(context, t);
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
            }
          },
          child: Text(s)),
    );
  }
}
