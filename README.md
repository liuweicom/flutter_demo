### flutter知识

### flutter安装：

### dart基础
参考资料：[dart中文网](http://dart.goodev.org/guides/get-started)


如何快速和运行一个flutter项目
1.可视化的方式
file -> new -> flutter 
点击绿色三角形启动flutter项目
2.命令行的方式：
````
flutter create flutter_app 
运行flutter run
````
如何使用flutter包和网站
[flutter包管理平台](https://pub.dev/)
打开pubspec.yaml
添加
dependencied:
    flutter_color_plugin: ^0.0.2
    
    运行flutter packages get或者点击packages get
    
    
    引入包
    import "package:flutter_color_plugin/flutter_color_plugin.dart"
    
statelessWidget和statefulWidget组件
statelessWidget无状态组件：
继承自statelessWidget的组件有哪些：
container

路由的两中方式：
1.materialApp中定义的routes
2.navigator跳转

如何导入和使用flutter的资源文件:


如何打开第三方app:
下载第三方包url_launcher

如何兼容androidX版本

图片空间开发详解：

Image支持如下几种类型的构造函数：
new Image 用于imageProvider获取图像
new Image.asset使用key从assetBundle获取的图像
new Image.network从网络Url获取的图片
new Image.file从本地文件中获取的图片（这个本地指的是，安卓设备存储地指）
````
import 'dart:io';
Image.file(File('/sdcard/Download/stack.png'));

//如果提供的是相对路径，利用插件path_provider插件获取相对路径之前的绝对路径
//获取SdCard的路径：
Feture<File> _getLocalFile(String filename)async{
    String dir = (await getExternalStorageDirectory()).path;
    File f = new File('$dir/$filename');
    return f;
}
````
new Image.memory用于Uint8List获取图像

更具不同的分辨路，获取不同的图片
````
AssetImage 了解如何将逻辑请求asset映射到最接近当前设备像素比例的asset。为了使这种映射起作用，应该根据特定的目录结构来保存asset

…/image.png
…/Mx/image.png
…/Nx/image.png
…etc.

Image.asset(icons/heart.png, width: 26, height: 26)
//或者 Image(
height: 26,
width: 26,
image: AssetImage(icons/heart.png))

````

如何设置图片的placeholder:
安装transparent_image插件：


使用自定义Icon:
IconData(
    this.codePoint,//必填，对应font Icon对饮的16进制Unicode
    this.fontFamily,//字体库体系
    this.fontPackage,//字体在哪个包里，不填仅在自己程序包中查找
    this.matchTextDirection: false.//图标是否按照图标绘制方向显示
)
````
fonts:
    - family: devio
      fonts:
        - asset: fonts/devio.ttf



child: new Icon(new IconData(0xf5566, fontFamily: 'devio'),size: 100.0,color: Colors.blue);
````

动画Animation开发指南
基于tween的动画和基于物理的动画

打包问题：
flutter打包的安卓APK安装在高版本的手机上出现闪退
我遇见的闪退问题是因为  我打包的时候用的是flutter build apk  这个命令
可以改成 flutter build apk --target-platform android-arm64
这个命令打包试试。

