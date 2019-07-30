import "package:flutter/material.dart";

class fullWidget extends StatefulWidget {
  fullWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _fullWidgetState createState() => _fullWidgetState();
}

class _fullWidgetState extends State<fullWidget> {
  final pageController = new PageController(initialPage: 0);
  int tabIndex = 0;

  Future<Null> handleRefresh() async {
    await Future.delayed(Duration(seconds: 5));
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
        title: Text("StateFulWidget和其中常用组件"),
        leading: GestureDetector(

          onTap: () {
            Navigator.pop(context);
          },
          onLongPress: (){
            print("长按！");
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white70),
            child: Column(
              children: <Widget>[

                Text("雄安生活"),
                Image(
                  image: AssetImage("assets/image/pic_1.jpg"),
                  width: 50,
                  height: 50,
                ),
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
                    height: 100,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: PageView(
                      controller: pageController,
                      children: <Widget>[
                        Text("雄安生活"),
                        Text("雄安资讯"),
                        Text("个人中心")
                      ],
                    )),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          print(index);
          pageController.jumpToPage(index);
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
}
