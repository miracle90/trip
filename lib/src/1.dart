import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:trip_app/dart/data_type.dart';
import 'package:trip_app/dart/function.dart';
import 'package:trip_app/dart/generic.dart';
import 'package:trip_app/dart/oop.dart';
import 'package:trip_app/flutter_knowledge/statelessWidget.dart';

// 入口方法
void main() => runApp(LessWidgetPage());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart语法',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dart语法'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    _oopLearn();
    _functionLearn();
    _genericLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: ColorUtil.color('yellow')),
        ),
      ),
      body: Center(
          child: ListView(
            children: <Widget>[
              // DataType()
            ],
          )
      ),
    );
  }
  void _oopLearn() {
    print('~~~~~~~ _oopLearn ~~~~~~~~~~~');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);

    Student.doPrint('静态方法');
    Student stu1 = Student('清华', 'Tony', 18);
    stu1.school = '985';
    print(stu1.toString());

    Student stu2 = Student('北大', 'Tom', 16, city: '无为', country: '安徽');
    print(stu2);

    StudyFlutter studeyFlutter = StudyFlutter();
    studeyFlutter.study();
  }
  void _functionLearn() {
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }

  void _genericLearn() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
