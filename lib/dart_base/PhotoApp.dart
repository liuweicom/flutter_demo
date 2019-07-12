import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];

  Future<bool> checkAndRequestCameraPermissions() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([PermissionGroup.camera]);
      return permissions[PermissionGroup.camera] == PermissionStatus.granted;
    } else {
      return true;
    }
  }

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);//关闭底部弹出框
//    if(await checkAndRequestCameraPermissions()){
//      print("权限不够！");
//      var image = await ImagePicker.pickImage(source: isTakePhoto?ImageSource.camera:ImageSource.gallery);
//
//      if(image == null){
//        throw Exception("图片不存在！");
//      }else{
//        setState(() {
//          _images.add(image);
//        });
//      }
//    }
    var image = await ImagePicker.pickImage(source: isTakePhoto?ImageSource.camera:ImageSource.gallery);

    if(image == null){
      throw Exception("图片不存在！");
    }else{
      setState(() {
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照片或者打开相册'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 6,
          runSpacing: 4,
          children: getImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          print("onpress==========");
          pickimage();
        },
        tooltip: '拍照',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void pickimage() {
    showModalBottomSheet(context: context, builder: (context)=>Container(
      height: 160,
        child: Column(
          children: <Widget>[
            _item("拍照",true),
            _item("从相框中选择",false),
          ],
        ),
    ));
  }

  _item(String s, bool param1) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(param1?Icons.camera_alt : Icons.photo_library),
        title: Text(s),
        onTap: ()=>getImage(param1),
      ),
    );
  }

  getImages() {
    return _images.map((file){
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.file(file),
          ),
          Positioned(
            right: 5,
              top: 5,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _images.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Icon(Icons.close,size: 18,color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }

}
