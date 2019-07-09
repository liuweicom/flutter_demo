### [移动端开发新趋势Flutter](https://www.jianshu.com/p/1a90adc09e99)
> Flutter是Google开发的新一代跨平台方案，Flutter可以实现写一份代码同时运行在iOS和Android设备上，并且提供很好的性能体验。Flutter使用Dart作为开发语言，这是一门简洁、强类型的编程语言。Flutter对于iOS和Android设备，提供了两套视觉库，可以针对不同的平台有不同的展示效果。

在Google刚推出Flutter时，其发展很缓慢，终于在18年发布第一个Bate版之后迎来了爆发性增长，发布第一个Release版时增长速度更快。可以从Github上Star数据看出来这个增长的过程。在19年最新的Flutter 1.2版本中，已经开放Web支持的Beta版。

[github start的增长率]()
目前运用flutter的大型项目：
- 阿里咸鱼
- 头条的抖音
- 腾讯的NOW直播
整体框架
Flutter可以理解为开发SDK或者工具包，其通过Dart作为开发语言，并且提供Material和Cupertino两套视觉控件，视图或其他和视图相关的类，都以Widget的形式表现。Flutter有自己的渲染引擎，并不依赖原生平台的渲染。Flutter还包含一个用C++实现的Engine，渲染也是包含在其中的。

上图：
[]()

hot Reload
Flutter支持亚秒级热重载，Android Studio和VSCode都支持Hot Reload的特性。但需要区分的是，热重载和热更新是不同的两个概念，热重载是在运行调试状态下，将新代码直接更新到执行中的二进制。而热更新是在上线后，通过Runtime或其他方式，改变现有执行逻辑。

[跨平台方案对比](https://juejin.im/post/5d0bac156fb9a07ec56e7f15)
[跨平台框架的发展历史]()
|类型 |React Native |flutter  |
|---:  |:---:|:---: |
|语言|JavaScript(动态语言)|dart(伪动态语言的强类型语言)|
|环境|JSCore|Flutter Engine|
|发布时间|2015|2017
|star|78k+|67k+
|对比版本|0.59.9|1.6.3
|空项目打包大小|Android  20M(可调整至 7.3M) /  IOS 1.6M|Android 5.2M / IOS 10.1M
|代码产物|JS Bundle 文件|二进制文件
|维护者|Facebook|Google
|风格|响应式，Learn once, write anywhere|响应式，一次编写多平台运行
|支持|Android、IOS、(PC)|Android、IOS、(Web/PC)
|使用代表|京东、携程、腾讯课堂|闲鱼、美团B端
|插件安装|npm插件 | pub插件|
缺点：
在跨平台开发中，就不得不说到接入`原有平台的支持`，比如 在 Android 平台上接入 x5 浏览器 、接入视频播放框架、接入 Lottie 动画框架等等。
这一需求 `React Native 先天就支持`，甚至在社区就已经提供了类似 lottie-react-native  的项目。  因为 React Native 整个渲染过程都在原生层中完成，所以接入原有平台控件并不会是难事  ，同时因为发展多年，虽然各类第三方库质量参差不齐，但是`数量上的优势`还是很明显的。目前为止， Flutter 原生控件的接入上是`仍不如` React Native `稳定`。

### [flutter在window环境下安装安装](https://flutterchina.club/setup-windows/)
1. 获取最新的flutter安装包
2. 更新环境变量
    在“用户变量”下检查是否有名为“Path”的条目:
    如果该条目存在, 追加 flutter\bin的全路径，使用 ; 作为分隔符.
    如果条目不存在, 创建一个新用户变量 Path ，然后将 flutter\bin的全路径作为它的值.
    
3. 运行flutter doctor检查一下flutter基本环境，是否还需要安装什么依赖，缺什么根据提示安装什么
4. 编辑器的一些配置（我自己用的Idea, 直接file->setting->plugin->安装flutter）

### 如何快速和运行一个flutter项目
1. 可视化的方式

    新建： 
        file -> new -> flutter 
        
    启动： 
        点击绿色三角形启动flutter项目
2. 命令行的方式：
````
flutter create flutter_app 
运行flutter run
````
###如何调试和使用开发工具

### dart基础
参考资料：[dart中文网](http://dart.goodev.org/guides/get-started)
dart常用语法：



dart对于web开发着来说：






如何使用flutter包和网站
[flutter包管理平台](https://pub.dev/)
打开pubspec.yaml
添加
````
dependencied:
    flutter_color_plugin: ^0.0.2
    
    运行flutter packages get或者点击packages get
    
    
    引入包
    import "package:flutter_color_plugin/flutter_color_plugin.dart"
    
````    
[State生命周期](https://juejin.im/post/5b09fe716fb9a07aa114a6d9)：

State的生命周期有四种状态：

created：当State对象被创建时候，State.initState方法会被调用；
initialized：当State对象被创建，但还没有准备构建时，State.didChangeDependencies在这个时候会被调用；
ready：State对象已经准备好了构建，State.dispose没有被调用的时候；
defunct：State.dispose被调用后，State对象不能够被构建。
[生命周期图片]()
完整生命周期如下：

3.2.2 setState

State中比较重要的一个方法是setState，当修改状态时，widget会被更新。比方说点击CheckBox，会出现选中和非选中状态之间的切换，就是通过修改状态来达到的。
查看setState源码，在一些异常的情况下将会抛出异常：

传入的为null；
处在defunct阶段；
created阶段还没有被加载（mounted）；
参数返回一个Future对象。

检查完一系列异常后，最后调用代码如下：
_element.markNeedsBuild();
复制代码markNeedsBuild内部，则是通过标记element为diry，在下一帧的时候重建（rebuild）。可以看出setState并不是立即生效，它只是将widget进行了标记，真正的rebuild操作，则是等到下一帧的时候才会去进行。


创建一个State对象时，会调用StatefulWidget.createState；
和一个BuildContext相关联，可以认为被加载了（mounted）；
调用initState；
调用didChangeDependencies；
经过上述步骤，State对象被完全的初始化了，调用build；
如果有需要，会调用didUpdateWidget；
如果处在开发模式，热加载会调用reassemble；
如果它的子树（subtree）包含需要被移除的State对象，会调用deactivate；
调用dispose,State对象以后都不会被构建；
当调用了dispose,State对象处于未加载（unmounted），已经被dispose的State对象没有办法被重新加载（remount）。




statelessWidget和statefulWidget组件

statelessWidget无状态组件：

继承自statelessWidget的组件有哪些：
container


基本手势：


路由的两中方式：
1.materialApp中定义的routes
2.navigator跳转





如何兼容androidX版本

如何导入和使用flutter的资源文件:

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



如何设置图片的placeholder:

安装transparent_image插件：


动画Animation开发指南
基于tween的动画和基于物理的动画


基于http实现网络操纵：


异步：Futrue与FutrueBuilder使用技巧：
Feture表示再接下得某个时间得值或者错误，借助Feture我们可以再Flutter实现异步操作，类似promise,提供了then 和catchError
有两中状态：
pending-执行中
completed-执行结束，分两中情况，要么成功，要么失败

Feture<R>then<R>(Feture<R> onValue(T value),{function onError});//第一个参数会成功调用，第二个参数错误时调用，不写第二个参数时，写catchError()

feture.whenCompile: 再异步结束时调用，类似于try-catch后面的finally

feture.timeout():设置异步超时时间
用法：

````
fetchGet().timeout(Duration(milliseconds: 2000)).then((CommonModal value){
                  setState((){
                    responseString = '请求结果：\nicon：${value.title}\nicon:${value.icon}';
                  });
                }).catchError((err){
                  setState((){
                    print(err);
                    responseString = "报错了";
                  });
                }).whenComplete((){
                  print("end");
                });
````

FetureBuilder：是一个将异步操作和异步UI更新结合在一块得类，通过它我们可以将网络请求，数据库读取等得结果更新到页面上
里面得属性设置:
feture：Feture对象表示此构造器当前链接得异步计算
initialData: 表示一个非空得Feture完成钱得初始化
builder：AsyncWidgetBuilder类型得回调函数，是一个基于异步交互构建widget得函数



JSON解析与复杂模型转换使用技巧：

基于shared_preference本地存储操作：
shared_preferences是Flutter社区开发得一个本地数据存储：简单的额，异步的，持久化的key-value存储系统
在Android它是基于sharedPreferences的，ios:NSUserDefaults的
````
final prefs = await SharedPreferences.getInstance();
//设置数据
pres.setInt("count",1);
//读取数据
pres.getInt("count");
//删除数据
prefs.remove("count");
````

Android如何内嵌flutter：

flutter如何内嵌webView:

如何打开第三方app:
下载第三方包url_launcher



Flutter通信：
Flutter定义了三种类的Channel：
- basicMessageChannel: 用于传递字符串和半结构化的信息，持续通信，收到消息后可以回复此次消息。
Native端：
````
BasicMessageChannel(BinaryMessenger messenger, String name, MessageCode<T> codec);
//BinaryMessenger messenger-消息信使，是消息得发送和接受得工具
//String name Channel的名字，也是唯一标识符
//MessageCode<T> codec 消息的编解码器，有几种不同的类型：
    BinaryCodec-最为简单的一中COdec,因为其返回值和入参的类型相同，均为二进制。由于为二进制，在传递内存数据快时不需要再次编解码
    StringCodec-用于字符串与二进制之间的编解码，其编码格式UTF-8
    JSONMessageCodec-用于基础数据与二进制数据之间的编解码，其支持基础数据类型以及列表，字典。
    StandarMessageCodec-是BasicMessageChannel的默认编解码，其支持基础数据类型，二进制，列表，字典，其工作原理。

void setMessageHandler(BasicMessageChannel.messageHandler<T> handler)
 //让其接收Dart发来的消息，配合BinaryMessage完成消息的处理
 //   BasicMessageChannel.messageHandler原型
 //   public interface MessageHandler<T>{
 //      void onMessage(T var1, BasicMessageChannel.Peply<T> vars)//var1是消息内容，var2是回复此消息的回调函数
 //}
 
 void send(T message)
 void send(T message, BasicMessageChannel.Peply<T> callback)
 //message是要传递给dart的，callback消息发送之后，收到dart回复的回调函数
````

BasicMessageChannel: 
- MethodChannel:用地传递方法调用一次性通信：Flutter调用Native拍照
- EventChannel: 用于数据流的通信，持续通信，收到消息后无法回府此次消息，通过常用于Native向dart的通信：手机电量变化，网络连接变化，陀螺仪，传感器


flutter打包过程：




### 遇到过的坑：
打包问题：
flutter打包的安卓APK安装在高版本的手机上出现闪退
我遇见的闪退问题是因为  我打候用的是flutter build apk  这个命令
可以改成 flutter build apk --target-platform android-arm64
这个命令打包试试。

