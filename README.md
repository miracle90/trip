# Flutter实战

## 采坑记录   

### 1、运行项目一直在 “Running Gradle task 'assembleDebug'...”

* 切换镜像
* 执行 `flutter precache`

```
maven { url 'https://maven.aliyun.com/repository/google' }
maven { url 'https://maven.aliyun.com/repository/jcenter' }
maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
```

## 一、环境搭建

* Flutter SDK
* 安卓环境
* IOS环境 => Xcode安装
* Android studio、vscode
* Flutter插件、Dart插件
* 模拟器安装、配置
* flutter doctor命令
* 环境变量配置

## 二、Dart

### 1、Dart概述

* 强类型语言 & 静态语言 => Java，C#等
* 面向对象的语言，OOP => Python，C++,Objective-C，Java等
* JIT：即时编译，开发期间，更快编译，更快的重载
* AOT：事前编译，release期间，更快更流畅

### 2、常用数据类型

## 三、Flutter基础

### 1、快速搭建和运行调试项目

### 2、Flutter包和插件的使用

### 3、StatelessWidget

* Container

### 4、StatefulWidget

* MaterialApp 页面根节点
* Scaffold，带有appBar，底部导航栏，侧边栏的组件
* AppBar，头部标题
* BottomNavigationBar，底部导航栏
* RefreshIndicator，刷新指示器
* Image => Image.nextwork
* TextField，输入框
* PageView，类似轮播

### 5、Flutter布局

### Container

### RenderObjectWidget 

* SingleChildRenderObjectWidget
  * Opacity
  * ClipOval
  * ClipRRect
  * PhysicalModel
  * Align
  * Padding
  * SizedBox
  * FractionallySizedBox
* MultiChildRenderObjectWidget
  * Stack
  * Flex
    * Column
    * Row
  * Wrap
  * Flow

### ParentDataWidget

* Positioned
* Flexible => Expanded 展开

### 6、路由和导航

* 定义 routes => 'less': (BuildContext context) => LessWidgetPage()
* Navigator.pushNamed(context, routeName)
* Navigator.push(context, MaterialPageRoute(builder: (context) => page))
* Navigator.pop(context)

### 7、检测用户手势以及处理点击事件

GestureDetector

* onTap 单击
* onDoubleTap 双击
* onLongPress 长按
* onTapCancel 点击取消
* onTapUp: (e) => fn() 松开
* onTapDown: (e) => fn() 按下

### 8、如何导入和使用Flutter的资源文件

* 图片
* 字体文件

1. pubspec.yaml => assets
2. AssetImage(path)

### 9、如何打开第三方应用

url_launcher 插件

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Scaffold(
    body: Center(
      child: RaisedButton(
        onPressed: _launchURL,
        child: Text('Show Flutter homepage'),
      ),
    ),
  ));
}

_launchURL() async {
  const url = 'https://flutter.cn';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
```

### 10、生命周期

### StatefulWidget 生命周期（页面级别）

* 初始化时期 createState、initState
* 更新时期 didChangeDependencies、build、didUpdateWidget
* 销毁期 deactivate、dispose

```dart
class WidgetLifecycle extends StatefulWidget {
  /// 当我们构建一个新的 StatefulWidget 时，会立即调用 createState
  /// 并且这个方法必须被覆盖
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  /// 这是创建 widget 时调用的除构造方法外的第一个方法
  /// 类似于 Android 的 onCreate() 与 ios的 viewDidLoad()
  /// 在这个方法中通常会做一些初始化的工作，比如 channel 的初始化，监听器的初始化
  @override
  void initState() {
    print('~~~~~~initState~~~~~~');
    super.initState();
  }
  
  /// 当依赖的 State 对象改变时会调用
  /// a. 在第一次构建 widget 时，在 initState() 之后立即调用此方法
  /// b. 如果的 StatefulWidgets 依赖于 InheritedWidget，那么当当前 State 所依赖的 InheritedWidget 中的变量改变时会再次调用它
  /// 拓展：InheritedWidget 可以高效的将数据在 Widget 树中向下传递、共享
  @override
  void didChangeDependencies() {
    print('~~~~~~~~~~didChangeDependencies~~~~~~~~~~~~');
    super.didChangeDependencies();
  }

  /// 这是一个必须实现的方法，在这里实现你要呈现的页面内容
  /// 它会在 didChangeDependencies() 之后立即调用
  /// 另外当调用 setState 后也会再次调用该方法
  @override
  Widget build(BuildContext context) {
    print('~~~~~~~~~~Build~~~~~~~~~~~~');
    return Scaffold(
      appBar: Appbar(
        title: Text('生命周期'),
      )     
    );
  }
  
  /// 这是一个不常用到的生命周期方法，当父组件需要重新绘制时才会调用
  /// 该方法会携带一个 oldWdiget 参数，可以将其与当前的 widget 进行对比以便执行一些额外的逻辑
  /// if (oldWidget.xxx != widget.XXX) ...
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('~~~~~~~~~~didUpdateWidget~~~~~~~~~~~~');
    super.didUpdateWidget();
  }
  
  /// 很少使用，在组件被移除时调用，在dispose之前调用
  @override
  void deactivate() {
    print('~~~~~~~~~~~~~~deactivate~~~~~~~~~~~~~')
    super.deactivate();
  }

  /// 常用，组件被销户时调用
  /// 通常在该方法中执行一些资源的释放工作，比如监听器的写在，channel的销毁等
  @override
  void dispose() {
    print('~~~~~~~~~~~~~~dispose~~~~~~~~~~~~~');
    super.dispose();
  }

}
```

### Flutter 应用的生命周期

```dart
/// WidgetsBindingObserver 是一个 Widgets 绑定观察期，通过它我们可以监听应用的生命周期、语言相关的变化
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      print('App进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('App进入前台');
    } else if (state == AppLifecycleState.inactive) {
      // 不常用，应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
    } else if (state == AppLifecycleState.suspending) {
      // 不常用：应用程序被挂起时调用，它不会在ios上触发
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();    
  }
}
```

### 11、修改Flutter应用的主题

MaterialApp => theme => ThemeData

```dart
Brightness.dart // light
```

### 12、如何自定义字体

ttf字体文件

pubspec.yaml 文件中配置资源目录

```yaml
 fonts:
   - family: Schyler
     fonts:
       - asset: fonts/Schyler-Regular.ttf
       - asset: fonts/Schyler-Italic.ttf
         style: italic
   - family: Trajan Pro
     fonts:
       - asset: fonts/TrajanPro.ttf
       - asset: fonts/TrajanPro_Bold.ttf
         weight: 700
```

> 局部使用字体 style => TextStyle => fontFamily




