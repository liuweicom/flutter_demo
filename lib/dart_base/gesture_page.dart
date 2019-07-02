import "package:flutter/material.dart";

class gesture_page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '手势及其组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '手势及其组件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _gesture_pageState createState() => _gesture_pageState();
}

class _gesture_pageState extends State<MyHomePage> {
  int tabIndex = 0;
  String printString="";
  double moveX=0;
  double moveY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FractionallySizedBox(
              widthFactor: 1,
              child: Stack(
                children: <Widget>[
                  Container(
                    //实际上没有撑满，只有内容的宽度
                    child: GestureDetector(
                      onTap: (){
                        print("点击");
                        _printString("点击");
                      },
                      onLongPress: (){
                        _printString("长按");
                      },
                      onTapCancel: (){
                        _printString("取消");
                      },
                      onTapDown: (e){
                        _printString("按下");
                      },
                      child: Container(
                        child: Text("老铁走起！"),
                      ),
                    ),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),

                  Positioned(
                    left: moveX,
                    top: moveY,
                    child: GestureDetector(
                      onPanUpdate: (e)=> _doMove(e),
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.all(Radius.circular(36))),
                      ),
                    ),
                  )
                ],
              )
          ),
          Text(printString),
        ],
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



  _doMove(e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }

  void _printString(String s) {
    setState(() {
      printString+= s;
    });
  }
}
