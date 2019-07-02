import 'package:flutter/material.dart';

class lessWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'statelessWiget和常用组件',
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
      home: MyHomePage(title: 'statelessWiget和常用组件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(//设置宽高，边框，padding，margin,背景颜色，背景图片
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: Colors
        .black12,width: 1),borderRadius: BorderRadius.all(Radius.circular(20)), ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "hello world",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Divider(
              height: 10,
              color: Colors.white,
            ),
            Chip(
              avatar: Icon(Icons.people),
                elevation: 10,
                label: Text("前端宝贝"),
            ),
            BackButton(
              color: Colors.black12,
            ),
            CloseButton(),
            Card(//自带圆角，边框和阴影
              color: Colors.white70,
              child: Container(
                child: Text("这是card"),
              ),
            ),
            AlertDialog(
              title: Text("警告"),
              content: Text("前方帅哥路过！",style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      )
    );
  }
}
