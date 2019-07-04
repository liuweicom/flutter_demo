import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync:
            this); //当再当前页面不显示时，停止动画，SingleTickerProviderStateMixin，在不运行时，回收资源
    //animate()返回的是一个Animation，而不是一个Animatable。Tween继承自Animatable
   //这里必须在addListener()回调函数中必须添加setState的调用，这样才会出发页面重新渲染，动画才能有效
    animation = new Tween<double>(begin: 0, end: 300).animate(controller
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      }))
      ..addStatusListener((status) {
        animationStatus = status;
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
            child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.reset();
                  controller.forward();
                },
                child: Text("开始"),
              ),
              Text('状态：' + animationStatus.toString()),
              Text("值：" + animationValue.toString()),
              Container(
                width: animationValue,
                height: animationValue,
                child: Image(image: AssetImage("assets/image/pic_1.jpg")),
              )
            ],
          ),
        )));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();//用完记得销毁
    super.dispose();
  }
}
