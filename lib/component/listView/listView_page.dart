import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  String responseString =" ";
  final List<String> _listCity = ["北京","上海","广州","深圳","杭州","苏州",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垂直方向的ListView'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          height: 800,
          child: Column(
            children: <Widget>[
            ListView(
              children: (_listCity.map((city){return _getItem(city);})).toList(),
            ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _getItem(String city) {
    return ListTile(
      title: Text(city),
        subtitle: Text("城市")
    );
  }
}



