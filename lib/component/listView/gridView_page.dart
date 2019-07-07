import 'package:flutter/material.dart';

class GradeViewPage extends StatefulWidget {
  @override
  _GradeViewPageState createState() => _GradeViewPageState();
}

class _GradeViewPageState extends State<GradeViewPage> {
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
      body: GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.all(10),
        crossAxisCount: 2,
        children: _getItem(_listCity),
      )
    );
  }

  List<Widget> _getItem(List<String> citys) {
    return citys.map((city){
      return _item(city);
    }).toList();
  }

  Widget _item(city) {
    return Container(
      height: 80,
//      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Center(
        child: Text(city,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
