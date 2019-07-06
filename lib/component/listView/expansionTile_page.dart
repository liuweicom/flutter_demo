import 'package:flutter/material.dart';
const listCity = {
  "北京": ['东城区','西城区','朝阳区','台风去','石景山区','海淀区',],
  "上海":['黄浦江','徐汇区','长宁区','静安区','普陀区','闸北区','虹口区',],
  "广州":['海珠','荔湾','天河','白云','黄埔','南沙','番禺',],
  "深圳":['南山','福田','罗湖','盐田','龙岗','宝安','龙华',],
  "杭州":['上城区','下城区','江干区','拱野区','西湖区','滨江区',],
  "苏州":['姑苏区','吴中区','相城区','高新区','虎丘区','工业园区','吴江区',],
};
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

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
          child: Column(
            children: <Widget>[
              ListView(
                children: buildList(listCity)
              ),
            ],
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

  buildList(Map<String, List<String>> listCity) {
    List<Widget> widgets = [];
    listCity.keys.map((city){
      widgets.push(_getItems(city, listCity[city]));
    });
    return widgets;
  }

  _getItems(String city, List<String> listCity) {
    return ExpansionTile(
        title: Text(city),
        children: _getChilds(listCity)
    );
  }

  _getChilds(List<String> listCity) {
    return listCity.map((item){
      return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          child: Text(item),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.blue
          ),
        ),
      );
    });
  }
}



