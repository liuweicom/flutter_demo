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
参考资料：
- [dart中文网](http://dart.goodev.org/guides/get-started)
- [dart常用语法](https://juejin.im/post/5b5005866fb9a04fea589561)：

#### dart常用语法
> 在Dart中，一切都是对象，一切对象都是class的实例，哪怕是数字类型、方法甚至null都是对象，所有的对象都是继承自Object 
 
- 注释：
````
//

/*
*
*/

///
````
- 控制台输出： print

- 字符串使用单引号或双引号均可，如'hello', "hello"
字符串插入可以使用类似`$name`或`${name}`的语法

- Dart中变量可以以字母或下划线开头，后面跟着任意组合的字符或数字

- 数据类型：
Dart有如下几种内建的数据类型：
````
numbers// int double 
strings
booleans
lists(或者是arrays)//List List<String>
maps// Map
runes（UTF-32字符集的字符）
symbols
Function
````

- 如何定义变量

你可以明确指定某个变量的类型，如int bool String，也可以用var或 dynamic来声明一个变量，Dart会自动推断其数据类型。
````
var a = 1;
  int b = 10;
  String s = "hello";
  dynamic c = 0.5;
````
**_**注意：没有赋初始值的变量都会有默认值null**_**

- final和const

如果你绝不想改变一个变量，使用final或const，不要使用var或其他类型，一个被final修饰的变量只能被赋值一次，一个被const修饰的变量是一个编译时常量（const常量毫无疑问也是final常量）。可以这么理解：final修饰的变量是不可改变的，而const修饰的表示一个常量。
注意：实例变量可以是final的但不能是const的
````
 final String name = 'zhangsan';
  name = 'lisi'; // 编译不通过，被final修饰的是常量，不可重新赋值
  const a = 0;
  a = 1; // 错误
````
final和const的区别：

区别一：final 要求变量只能初始化一次，并不要求赋的值一定是编译时常量，可以是常量也可以不是。而 const 要求在声明时初始化，并且赋值必需为编译时常量。

区别二：final 是惰性初始化，即在运行时第一次使用前才初始化。而 const 是在编译时就确定值了。


- 函数
1. Dart是一个面向对象的编程语言，所以即使是函数也是一个对象，也有一种类型`Function`，这就意味着函数可以赋值给某个变量或者作为参数传给另外的函数。虽然Dart推荐你给函数加上返回值，但是不加返回值的函数同样可以正常工作，另外你还可以用`=>`代替`return`语句，
2. 使用花括号将函数的参数括起来就是定义了`命名参数`,定义命名参数时，你可以以`{type paramName}`或者`{paramName: type}`两种方式声明参数，而调用命名参数时，需要以funcName(paramName: paramValue)的形式调用。
3. `命名参数`的参数`并不是必须`的，如果要表示一个参数是必须的，`@required`注解来标识一个命名参数，这代表该参数是必须的，你不传则会报错
4. 使用中括号[]括起来的参数是函数的`位置参数`，代表该参数可传可不传，位置参数只能放在函数的参数列表的最后面。
5. 你可以为命名参数或者位置参数设置默认值
6. ***不论在Dart还是Flutter中，必须都需要一个顶层的`main()`函数，它是`整个应用的入口函数`，main()函数的返回值是void
7. 所有的函数`都有返回值`，如果没有指定return语句，那么该函数的返回值为`null`
````
// 声明返回值
int add(int a, int b) {
  return a + b;
}

// =>是return语句的简写
add3(a, b) => a + b; 

sayHello({String name}) {
  print("hello, my name is $name");
}

sayHello2({name: String}) {
  print("hello, my name is $name");
}

const Scrollbar({Key key, @required Widget child})//child是必须的

sayHello(String name, int age, [String hobby]) { // 位置参数可以有多个，比如[String a, int b]
  StringBuffer sb = new StringBuffer();
  sb.write("hello, this is $name and I am $age years old");
  if (hobby != null) {
    sb.write(", my hobby is $hobby");
  }
  print(sb.toString());
}

// 命名参数的默认值
int add({int a, int b = 3}) { // 不能写成：int add({a: int, b: int = 3})
  return a + b;
}

// 位置参数的默认值
int sum(int a, int b, [int c = 3]) {
  return a + b + c;
}

````
- 运算符
Dart中的运算符与Java中的类似，比如++a a == b b ? a : b，但是也有一些与Java不太一样的运算符
````
main() {
  // 与Java相同的运算符操作

  int a = 1;
  ++a;
  a++;
  var b = 1;
  print(a == b);  // false
  print(a * b); // 3
  bool real = false;
  real ? print('real') : print('not real'); // not real
  print(real && a == b); // false
  print(real || a == 3); // true
  print(a != 2); // true
  print(a <= b); // false
  var c = 9;
  c += 10;
  print("c = $c"); // c = 19
  print(1<<2); // 4

  // 与Java不太一样的运算符操作

  // is运算符用于判断一个变量是不是某个类型的数据
  // is!则是判断变量不是某个类型的数据
  var s = "hello";
  print(s is String); // true
  var num = 6;
  print(num is! String); // true

  // ~/才是取整运算符，如果使用/则是除法运算，不取整
  int k = 1;
  int j = 2;
  print(k / j); // 0.5
  print(k ~/ j); // 0

  // as运算符类似于Java中的cast操作，将一个对象强制类型转换
  (emp as Person).teach();

  // ??=运算符 如果 ??= 运算符前面的变量为null，则赋值，否则不赋值
  var param1 = "hello", param2 = null;
  param1 ??= "world";
  param2 ??= "world";
  print("param1 = $param1"); // param1 = hello
  print("param2 = $param2"); // param2 = world
  
  // ?.运算符
  var str1 = "hello world";
  var str2 = null;
  print(str1?.length); // 11
  print(str2?.length); // null 
  print(str2.length); // 报错
}

class Person {
  eat() {
    print("I am eating...");
  }

  sleep() {
    print("I am sleeping...");
  }

  study() {
    print("I am studying...");
  }
}

main() {
  // 依次打印
  //  I am eating...
  //  I am sleeping...
  //  I am studying...
  //使用..调用某个对象的方法（或者成员变量）时，返回值是这个对象本身
  new Person()..eat()
      ..sleep()
      ..study();
}


````
- 控制流程
`if / else` `switch` `for /while` `try / catch`语句跟Java中都类似，try / catch语句可能稍有不同
````
main() {
  // if else语句
  int score = 80;
  if (score < 60) {
    print("so bad!");
  } else if (score >= 60 && score < 80) {
    print("just so so!");
  } else if (score >= 80) {
    print("good job!");
  }

  // switch语句
  String a = "hello";
  // case语句中的数据类型必须是跟switch中的类型一致
  switch (a) {
    case "hello":
      print("haha");
      break;
    case "world":
      print("heihei");
      break;
    default:
      print("WTF");
  }

  // for语句
  List<String> list = ["a", "b", "c"];
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  for (var i in list) {
    print(i);
  }
  // 这里的箭头函数参数必须用圆括号扩起来
  list.forEach((item) => print(item));

  // while语句
  int start = 1;
  int sum = 0;
  while (start <= 100) {
    sum += start;
    start++;
  }
  print(sum);

  // try catch语句
  try {
    print(1 ~/ 0);
  } catch (e) {
    // IntegerDivisionByZeroException
    print(e);
  }
  try {
    1 ~/ 0;
  } on IntegerDivisionByZeroException { // 捕获指定类型的异常
    print("error"); // 打印出error
  } finally {
    print("over"); // 打印出over
  }
}

````
- 类

类的定义个构造方法：
1. Dart中的类没有访问控制，所以你不需要用`private`, `protected`, `public等修饰成员变量或成员函数`
2. 类除了有跟`类名相同的构造方法`外，还可以添加`命名的构造方法`。
3. Dart中使用extends关键字做类的继承，如果一个类`只有命名的构造方法`，在继承时需要注意,必须调用父类命名的构造方法。格式如下这种，super写在花括号外面。
4. 上面的代码中已经有了一些类的成员方法的定义，这些定义方式跟Java很类似，你可以为某个类的成员变量提供`getter/setter`方法（至今没用上过）

````
class Person {
  String name;
  int age;
  String gender;
  Person(this.name, this.age, this.gender);//
  sayHello() {
    print("hello, this is $name, I am $age years old, I am a $gender");
  }
}

 var p = new Person("zhangsan", 20, "male");
  p.sayHello(); // hello, this is zhangsan, I am 20 years old, I am a male
  p.age = 50;
  p.gender = "female";
  p.sayHello(); // hello, this is zhangsan, I am 50 years old, I am a female

//命名构造
class Point {
  num x, y;
  Point(this.x, this.y);
  // 类的命名构造方法
  Point.origin() {
    x = 0;
    y = 0;
  }
}

main() {
  // 调用Point类的命名构造方法origin()
  var p = new Point.origin();
  var p2 = new Point(1, 2);
}

class Human {
  String name;
  Human.fromJson(Map data) {
    print("Human's fromJson constructor");
  }
}

class Man extends Human {
  Man.fromJson(Map data) : super.fromJson(data) {
    print("Man's fromJson constructor");
  }
}

//getter setter
class Rectangle {
  num left, top, width, height;

  // 构造方法传入left, top, width, height几个参数
  Rectangle(this.left, this.top, this.width, this.height);

  // right, bottom两个成员变量提供getter/setter方法
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

````
抽象类和抽象方法

abstract修饰一个类，则这个类是抽象类，抽象类中可以有抽象方法和非抽象方法，抽象方法没有方法体，需要子类去实现，
````
abstract class Doer {
  // 抽象方法，没有方法体，需要子类去实现
  void doSomething();
  // 普通的方法
  void greet() {
    print("hello world!");
  }
}

class EffectiveDoer extends Doer {
  // 实现了父类的抽象方法
  void doSomething() {
    print("I'm doing something...");
  }
}
````
枚举类
使用enum关键字定义一个枚举类
````
enum Color { red, green, blue }
````
静态成员变量和静态成员方法
````
// 类的静态成员变量和静态成员方法
class Cons {
  static const name = "zhangsan";
  static sayHello() {
    print("hello, this is ${Cons.name}");
  }
}

main() {
  Cons.sayHello(); // hello, this is zhangsan
  print(Cons.name); // zhangsan
}

````
mixins

mixins是一个重复使用类中代码的方式（不是很理解）
````
class A {
  a() {
    print("A's a()");
  }
}

class B {
  b() {
    print("B's b()");
  }
}

// 使用with关键字，表示类C是由类A和类B混合而构成
class C = A with B;

main() {
  C c = new C();
  c.a(); // A's a()
  c.b(); // B's b()
}
````
 
- dart库导入
1. 导入第三方库
2. 导入自己写的代码，使用相对路径即可
3. 使用as为关键字为导入的某一个包设置前缀，或者别名
4. 可以再导入包时使用show hide关键词来导入某个包中的部分功能
5. 导入包时使用deferred as可以让这个包懒加载，懒加载的包只会在该包被使用的时得到加载，而不是一开始就加载

````
import 'dart:html';

import './util.dart';

import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// Uses Element from lib1.
Element element1 = Element();

// Uses Element from lib2.
lib2.Element element2 = lib2.Element();

// 只导入foo
import 'package:lib1/lib1.dart' show foo;

// 导入除了foo的所有其他部分
import 'package:lib2/lib2.dart' hide foo;

import 'package:greetings/hello.dart' deferred as hello;
````

- 异步
提供了类似es7中async await等异步操作
````
Future checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
````


#### 构建用户常用组件：
- 布局相关组件：
推荐相关文章：[flutter布局](https://juejin.im/post/5bab35ff5188255c3272c228)

![基本布局](/assets/note/基本布局.jpg)

- statelessWidget和statefulWidget组件
[]()
statelessWidget无状态组件：

继承自statelessWidget的组件有哪些：
container



- [State生命周期](https://juejin.im/post/5b09fe716fb9a07aa114a6d9)：

State的生命周期有四种状态：

created：当State对象被创建时候，State.initState方法会被调用；
initialized：当State对象被创建，但还没有准备构建时，State.didChangeDependencies在这个时候会被调用；
ready：State对象已经准备好了构建，State.dispose没有被调用的时候；
defunct：State.dispose被调用后，State对象不能够被构建。
[生命周期图片]()
完整生命周期如下：

 setState

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








- 如何使用flutter包和网站
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

- 基本手势：




- 如何导入和使用flutter的资源文件:

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



- 如何设置图片的placeholder:

安装transparent_image插件：




- 基于http实现网络操纵：


1. 异步：Futrue与FutrueBuilder使用技巧：
Feture表示再接下得某个时间得值或者错误，借助Feture我们可以再Flutter实现异步操作，类似promise,提供了then 和catchError
有两中状态：
pending-执行中
completed-执行结束，分两中情况，要么成功，要么失败
````
Feture<R>then<R>(Feture<R> onValue(T value),{function onError});//第一个参数会成功调用，第二个参数错误时调用，不写第二个参数时，写catchError()
````

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

1.  feture：Feture对象表示此构造器当前链接得异步计算
2.  initialData: 表示一个非空得Feture完成钱得初始化
3.  builder：AsyncWidgetBuilder类型得回调函数，是一个基于异步交互构建widget得函数



2. JSON解析与复杂模型转换使用技巧：

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

- 路由的两中方式：
1. materialApp中定义的routes
2. navigator跳转

- Android如何内嵌flutter：


- flutter如何内嵌webView:





- 动画Animation开发指南
基于tween的动画和基于物理的动画


- 如何兼容androidX版本

- 如何打开第三方app:
下载第三方包url_launcher



- Flutter通信：
Flutter定义了三种类的Channel：
1. basicMessageChannel: 用于传递字符串和半结构化的信息，持续通信，收到消息后可以回复此次消息。
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

2. MethodChannel:用地传递方法调用一次性通信：Flutter调用Native拍照
3. EventChannel: 用于数据流的通信，持续通信，收到消息后无法回府此次消息，通过常用于Native向dart的通信：手机电量变化，网络连接变化，陀螺仪，传感器



- flutter打包过程：
1. 创建 keystore
如果您有现有keystore，请跳至下一步。如果没有，请通过在运行以下命令来创建一个：
[如何生产jks](https://www.jianshu.com/p/b28a5be05029)：
打开Android studio 点击build->Generate Signed ApK -> 选择jks存放地址-> 创建jks -> 完成
再通过命令将jks转换长keystore:

 首先把jks文件转为p12信息文件 
````
keytool -importkeystore -srckeystore F:\pra\flutter_demo\android\app\key.jks -srcstoretype JKS -deststoretype PKCS12 -destkeystore F:\pra\flutter_demo\android\app\key.p12
````

然后把p12文件转为keystore文件
````

keytool -v -importkeystore -srckeystore F:\pra\flutter_demo\android\app\key.p12 -srcstoretype PKCS12 -destkeystore F:\pra\flutter_demo\android\app\key.keystore -deststoretype JKS
````

````
 keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
````
2. 引用应用程序中的keystore
创建一个名为<app dir>/android/key.properties的文件，其中包含对密钥库的引用：
````
 storePassword=<password from previous step>
     keyPassword=<password from previous step>
     keyAlias=key
     storeFile=<location of the key store file, e.g. /Users/<user name>/key.jks>

````     
3. gradle中配置签名
通过编辑<app dir>/android/app/build.gradle文件为您的应用配置签名

替换:
````
android {
````
为：
````
def keystorePropertiesFile = rootProject.file("key.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

android {
````
替换:
````
buildTypes {
    release {
        // TODO: Add your own signing config for the release build.
        // Signing with the debug keys for now, so `flutter run --release` works.
        signingConfig signingConfigs.debug
    }
}
````
为:
````
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
    }
}
buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}
````
4. 使用命令行
`cd <app dir> (<app dir> 为您的工程目录).`
运行`flutter build apk (flutter build 默认会包含 --release选项).`
报错了解决办法：更换命令：
````
flutter build apk --target-platform android-arm64
````
打包好的发布APK位于`<app dir>\build\app\outputs\apk\release。`
 
flutter如何迁移至web中：


### 遇到过的坑：
打包问题：
flutter打包的安卓APK安装在高版本的手机上出现闪退
我遇见的闪退问题是因为  我打候用的是flutter build apk  这个命令
可以改成 flutter build apk --target-platform android-arm64
这个命令打包试试。

