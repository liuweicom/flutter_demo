import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountPage extends StatefulWidget {
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  String responseString ="";
  int count = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基于shared_preferences实现存储'),
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
              RaisedButton(
                child: Text("点我！"),
                onPressed: ()async{
                  final sharePreference = await SharedPreferences.getInstance();
                 int count =  sharePreference.getInt("count")??0;
                 setState(() {
                   responseString = responseString + '点我第${count}\n';
                 });
                 sharePreference.setInt("count", count+1);
                },
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


