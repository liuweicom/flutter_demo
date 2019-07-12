import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  @override
  _ExpansionTilePageState createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {

  var CITY_NAMES = {
    "北京": ['东城区','西城区','朝阳区','台风去','石景山区','海淀区',],
    "上海":['黄浦江','徐汇区','长宁区','静安区','普陀区','闸北区','虹口区',],
    "广州":['海珠','荔湾','天河','白云','黄埔','南沙','番禺',],
    "深圳":['南山','福田','罗湖','盐田','龙岗','宝安','龙华',],
    "杭州":['上城区','下城区','江干区','拱野区','西湖区','滨江区',],
    "苏州":['姑苏区','吴中区','相城区','高新区','虎丘区','工业园区','吴江区',],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('带折叠面版的ListView'),
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
              children: buildList()
          ),
          ),
        ),
    );
  }

  Widget _getItem(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.blue),
      child: Text(city),
    );
  }

  buildList() {
    List<Widget> widgets = [];
    print(CITY_NAMES.keys.toString());
    CITY_NAMES.keys.forEach((city){
      widgets.add(_getItems(city, CITY_NAMES[city]));
    });
    return widgets;
  }

  _getItems(String city, List<String> listCitys) {
    return ExpansionTile(
        title: Text(city),
        children: _getChilds(listCitys)
    );
  }

  _getChilds(List<String> listCitys) {
    return listCitys.map((item){
      return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          child: Text(item),
          height: 80,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Colors.blue
          ),
        ),
      );
    }).toList();
  }
}



