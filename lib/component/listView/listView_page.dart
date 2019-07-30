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
          child: ListView(
//            scrollDirection: Axis.horizontal,
            children: (_listCity.map((city){return _getItem(city);})).toList(),
          ),
          ),
        ),
      );
  }

  Widget _getItem(String city) {
    print(city);
    return Container(
//      width: 50,
      height: 80,
      margin: EdgeInsets.only(right: 10,bottom: 10),
      decoration: BoxDecoration(color: Colors.blue),
      child: ListTile(
          title: Text(city,style: TextStyle(color: Colors.white),),
          subtitle: Text("城市")
      ),
    );
  }
}



