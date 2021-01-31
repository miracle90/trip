import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  @override
  State createState() => _StatefulWidgetPageState;
}

class _StatefulWidgetPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 30, color: Colors.orange);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: '首页',
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              label: '列表',
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'I am text',
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}