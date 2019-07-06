import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  String responseString =" ";
  Future<CommonModal> fetchGet() async{
    final response1 = await http.get("http://www.devio.org/io/flutter_app/json/test_common_model.json");
    final result = json.decode(response1.body);
    return CommonModal.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('基于Http实现网络操作'),
    leading: GestureDetector(
    onTap: (){
    Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back),
    ),
    ),
    body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                fetchGet().timeout(Duration(milliseconds: 2000)).then((CommonModal value){
                  setState((){
                    responseString = '请求结果：\nicon：${value.title}\nicon:${value.icon}';
                  });
                }).catchError((err){
                  setState((){
                    print(err);
                    responseString = "报错了";
                  });
                }).whenComplete((){
                  print("end");
                });
              },
              child: Text("点我！"),
            ),
            Text(responseString),
          ],
        ),
      ),
    ),
    );
  }
}

class CommonModal{
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final String hideAppBar;

  CommonModal({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModal.fromJson(Map<String, dynamic> json1){
    return CommonModal(
        icon: json1['icon'],
        title: json1['title'],
        url: json1['url'],
        statusBarColor: json1['icon'],
        hideAppBar: json1['icon']
    );
  }
}


