import "package:flutter/material.dart";

//class flutterLayoutPage extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: '常用基本布局组件',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: '常用基本布局组件'),
//    );
//  }
//}

class flutterLayoutPage extends StatefulWidget {
  @override
  _flutterLayoutPageState createState() => _flutterLayoutPageState();
}

class _flutterLayoutPageState extends State<flutterLayoutPage> {
  final pageController = new PageController();
  int tabIndex = 0;

  Future<Null> handleRefresh() async {
    await Future.delayed(Duration(microseconds: 1));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white70)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('常用基本布局组件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white70),
              child: Column(
                children: <Widget>[
                  ClipOval(
                    //原型的
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        "http://www.devio.org/img/avatar.png",
                      ),
                    ),
                  ),
                  ClipOval(
                    //原型的
                    child: Image.network(
                      "http://www.devio.org/img/avatar.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        //设置圆角
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Opacity(
                          opacity: 0.6,
                          child: Image.network(
                            "http://www.devio.org/img/avatar.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      )),
                  Text("雄安生活"),
//                  Image(
//                    image: AssetImage("assets/image/pic_1.jpg"),
//                    width: 50,
//                    height: 50,
//                  ),
                  Image.network(
                    "http://www.devio.org/img/avatar.png",
                    width: 50,
                    height: 50,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        hintText: "请输入",
                        hintStyle: TextStyle(fontSize: 15)),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: PhysicalModel(
                        //使显示图形据有圆角
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        clipBehavior: Clip.antiAlias, //抗锯齿
                        child: PageView(
                          children: <Widget>[
                            _item("雄安生活", Colors.blue),
                            _item("雄安资讯", Colors.deepOrange),
                            _item("个人中心", Colors.amber),
                          ],
                        )),
                  ),
                  Column(
                    children: <Widget>[
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          //实际上没有撑满，只有内容的宽度
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text("宽度撑满"),
                          decoration: BoxDecoration(color: Colors.blue),
                        ),
                      ),
                      Container(
                        //实际上没有撑满，只有内容的宽度
                        child: Text("宽度撑满2"),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Image.network(
                        "http://www.devio.org/img/avatar.png",
                        width: 100,
                        height: 100,
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.network(
                          "http://www.devio.org/img/avatar.png",
                          width: 36,
                          height: 36,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    //创建一个wrap布局，从左到右进行排列，会自动换行
                    spacing: 8, //水平间距
                    runSpacing: 6, //垂直间距
                    children: <Widget>[
                      _chip("弹性公交"),
                      _chip("预约班车"),
                      _chip("公务出行"),
                      _chip("百度无人车"),
                      _chip("共享单车"),
                      _chip("小邮局"),
                    ],
                  ),
//                  Expanded(
//                    //默认container的高度只有内容的高度，使用这个之后可以设置高度填满剩余高度
//                    child: Container(
//                      decoration: BoxDecoration(color: Colors.deepOrange),
//                      child: Text("拉伸填满高度"),
//                    ),
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          print(index);
//          pageController.animateToPage(index, duration: null, curve: null);
          //, Duration(seconds: 1), Curve()
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

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(label.substring(0, 1)),
      ),
    );
  }
}
