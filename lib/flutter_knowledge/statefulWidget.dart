import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  @override
  _StatefulWidgetPageState createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  int _currentIndex = 0;

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
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            // 刷新组件要配合列表 ListView 使用
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                            '首页',
                            style: textStyle,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(color: Colors.lightBlueAccent,),
                            child: PageView(
                              children: <Widget>[
                                _item('Page1', Colors.deepPurple),
                                _item('Page2', Colors.deepOrange),
                                _item('Page3', Colors.deepOrangeAccent),
                                _item('Page4', Colors.deepPurpleAccent),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Text('列表'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white,)
      )
    );
  }
}
