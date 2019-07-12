import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图片控件开发'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
            child: Stack(
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            Center(
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'http://www.devio.org/img/avatar.png'),
            ),
            Center(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/image/loading.gif',
                  image: 'http://www.devio.org/img/avatar.png'),
            ),
          ],
        )));
  }
}
