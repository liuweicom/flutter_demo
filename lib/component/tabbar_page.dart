import 'package:flutter/material.dart';
import 'package:flutter_demo/component/pages/home_page.dart';
import 'package:flutter_demo/component/pages/search_page.dart';
import 'package:flutter_demo/component/pages/trip_page.dart';
import 'package:flutter_demo/component/pages/my_page.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  final Color _defaultColor = Colors.grey;
  final Color _acviteColor = Colors.blue;
  final PageController _controller = new PageController(initialPage: 0);
  int _currentIndex = 0;

  getItem(String title, IconData icons){
    return BottomNavigationBarItem(
      icon: Icon(icons,color: _defaultColor),
      activeIcon: Icon(icons, color: _acviteColor),
        title: Text(title)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("App首页框架"),
//      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TripPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _controller.jumpToPage(index);
          });
        },
          items: [
            getItem("首页", Icons.home),
            getItem("搜索", Icons.search),
            getItem("旅拍", Icons.camera_alt),
            getItem("我的", Icons.person),
          ],
          currentIndex: _currentIndex,
      ),
    );
  }
}
