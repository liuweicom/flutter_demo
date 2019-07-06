import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class FetureBuilderPage extends StatefulWidget {
  @override
  _FetureBuilderPageState createState() => _FetureBuilderPageState();
}

class _FetureBuilderPageState extends State<FetureBuilderPage> {
  String responseString =" ";
  Future<CommonModal> fetchGet() async{
    final response1 = await http.get("http://www.devio.org/io/flutter_app/json/test_common_model.json");
    Utf8Decoder utf8decoder = Utf8Decoder();//fix 修复中文乱码得问题
    final result = json.decode(utf8decoder.convert(response1.bodyBytes));
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

                },
                child: Text("点我！"),
              ),
        FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<CommonModal> snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return Text("请输入一个Url");
                break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                break;
                case ConnectionState.active:
                  return Text("active");
                break;
                case ConnectionState.done:
                  if(snapshot.hasError){//还有snapshot.hasData
                    return Text('${snapshot.error}');
                  }else{
                    return new Column(children: <Widget>[
                      Text('icon:${snapshot.data.icon}'),
                      Text('title:${snapshot.data.title}'),
                      Text('statusBarColor:${snapshot.data.statusBarColor}'),
                      Text('url:${snapshot.data.url}'),
                    ],);
                  }
                break;
              }
            },
            future: fetchGet()
        ),
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


