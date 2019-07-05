import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double Max_Scroller_Height = 100.0;
  double opacity=0;
  final List<String> _imageUrl = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
    'http://www.devio.org/img/avatar.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      NotificationListener(
          onNotification: (scrollNotification){
            if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0){
              _conScroll(scrollNotification.metrics.pixels);
            }
          },
        child: ListView(
          children: <Widget>[
            Container(
              height: 160,
              child:  Swiper(
                itemCount: _imageUrl.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(_imageUrl[index], fit: BoxFit.fill);
                },
                pagination: SwiperPagination(),
              ),
            ),
            Container(
              height: 800,
              child: Text("主页丫丫！！"),
            )
          ],
        ),
      ),
      Opacity(
          opacity: opacity,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("首页",style: TextStyle(color: Colors.deepOrange),),),
            ),
          )
      ),
    ],);
  }

  void _conScroll(double pixels) {
    print(pixels);
    double opacityParam = pixels/Max_Scroller_Height;
    if(opacityParam < 0){
      opacityParam = 0;
    }else if(opacityParam > 1){
      opacityParam = 1;
    }
    setState(() {
      opacity = opacityParam;
    });
  }
}
