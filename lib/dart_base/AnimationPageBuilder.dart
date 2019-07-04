import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

//AnimatedBuilder用于构建动画的通用widget，AnimationBuilder对于希望将动画作为更大构建函数的一部包含在内的更
//复杂的widget时非常有用。更好的将职责分离：1，显示logo,2.定义Animation对象3.渲染过度效果.
//与AnimatedWidget类似，AnimatedBuilder自动监听来自Animation对象的通知，不需要再手动监听addlistener()

class AnimationPageBuilder extends StatefulWidget {
  @override
  _AnimationPageBuilderState createState() => _AnimationPageBuilderState();
}



class _AnimationPageBuilderState extends State<AnimationPageBuilder>
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
                  GrowTransition(animation: animation, child: LogoApp(),),
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

//AnimatedWidget不在需要自己手动的setState不断变动animation的value,只要传入animation，就可以获取一直在变化的value
class GrowTransition extends StatelessWidget {
  final Animation<double> animation;

  final Widget child;
  GrowTransition({Key key, Animation<double> this.animation, Widget this.child});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, child){
          return Column(children: <Widget>[
            Text('状态：' + animation.status.toString()),
            Text("值：" + animation.value.toString()),
            Container(
              width: animation.value,
              height: animation.value,
              child: child,
            ),
          ]);
          },
          child: child
      ),
    );
  }
}

class LogoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image(image: AssetImage("assets/image/pic_1.jpg")),
      margin: EdgeInsets.all(10),
    );
  }
}


