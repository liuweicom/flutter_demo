import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPageWidget extends StatefulWidget {
  @override
  _AnimationPageWidgetState createState() => _AnimationPageWidgetState();
}

//AnimatedWidget不在需要自己手动的setState不断变动animation的value,只要传入animation，就可以获取一直在变化的value
class AnimationLogo extends AnimatedWidget {
  final Animation<double> animation;

  AnimationLogo({Key key, Animation<double> this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Text('状态：' + animation.status.toString()),
      Text("值：" + animation.value.toString()),
      Container(
        width: animation.value,
        height: animation.value,
        child: Image(image: AssetImage("assets/image/pic_1.jpg")),
      ),
    ]);
  }
}

class _AnimationPageWidgetState extends State<AnimationPageWidget>
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
    animation = new Tween<double>(begin: 0, end: 300)
        .animate(controller..addListener(() {}))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              controller.forward();
            } else if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画使用AnimationWidget'),
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
              GestureDetector(
                onTap: () {
                  controller.stop();
                },
                child: Text("停止"),
              ),
              AnimationLogo(animation: animation),
            ],
          ),
        )));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose(); //用完记得销毁
    super.dispose();
  }
}
