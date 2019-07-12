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
    Utf8Decoder utf8decoder = Utf8Decoder();//fix 修复中文乱码得问题
    final result = json.decode(utf8decoder.convert(response1.bodyBytes));//转成Map
    return CommonModal.fromJson(result);
  }

  Future<Autogenerated> fetchGetWidthTemplate() async{
    final response1 = await http.get("http://www.devio.org/io/flutter_app/json/test_common_model.json");
    Utf8Decoder utf8decoder = Utf8Decoder();//fix 修复中文乱码得问题
    final result = json.decode(utf8decoder.convert(response1.bodyBytes));//转成Map
    return new Autogenerated.fromJson(result);
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
//                fetchGet().timeout(Duration(milliseconds: 2000)).then((CommonModal value){
//                  setState((){
//                    responseString = '请求结果：\ntitle：${value.title}\nicon:${value.icon}\nurl:${value.url}\nstatusBarColor:${value.statusBarColor}\nhideAppBar:${value.hideAppBar}';
//                  });
//                }).catchError((err){
//                  setState((){
//                    print(err);
//                    responseString = "报错了";
//                  });
//                }).whenComplete((){
//                  print("end");
//                });

                fetchGetWidthTemplate().timeout(Duration(milliseconds: 2000)).then((Autogenerated value){
                  setState((){
                    responseString = '请求结果：\ntitle：${value.title}\nicon:${value.icon}\nurl:${value.url}\nstatusBarColor:${value.statusBarColor}\nhideAppBar:${value.hideAppBar}';
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
  final bool hideAppBar;

  CommonModal({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModal.fromJson(Map<String, dynamic> json1){
    return CommonModal(
        icon: json1['icon'],
        title: json1['title'],
        url: json1['url'],
        statusBarColor: json1['statusBarColor'],
        hideAppBar: json1['hideAppBar']
    );
  }
}

class Autogenerated {
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  Autogenerated(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}




