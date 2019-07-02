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

打包问题：
flutter打包的安卓APK安装在高版本的手机上出现闪退
我遇见的闪退问题是因为  我打包的时候用的是flutter build apk  这个命令
可以改成 flutter build apk --target-platform android-arm64
这个命令打包试试。

