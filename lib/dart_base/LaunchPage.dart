import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class ResourcePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '导入和使用flutter的资源文件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '导入和使用flutter的资源文件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: ()=> _openMap(),
              child: Text("打开高德地图"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          print(index);
          setState(() {
            tabIndex = index;
          });
        },
        currentIndex: tabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              title: Text("雄安生活")),
          BottomNavigationBarItem(icon: Icon(Icons.note), title: Text("雄安资讯")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人中心"))
        ],
      ),
    );
  }

  _launchUrl(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw '无法打开网页${url}';
    }
  }

  _openMap() async{
//    const url = 'geo:52.32,4.917';//APP提供着提供的schema
    const url = 'http://www.baidu.com';//APP提供着提供的schema
    if(await canLaunch(url)){
      await launch(url);
    }else{
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if(await canLaunch(url)){
        await launch(url);
      }else{
        throw '无法打开网页${url}';
      }
    }
  }

}
