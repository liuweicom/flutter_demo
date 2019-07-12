import 'package:flutter/material.dart';

class lessWidget extends StatefulWidget {
  lessWidget({Key key}) : super(key: key);

  @override
  _lessWidgetState createState() => _lessWidgetState();
}

class _lessWidgetState extends State<lessWidget> {
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
        title: Text('statelessWiget和常用组件'),
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
