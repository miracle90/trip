import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class LessWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 30, color: Colors.orange);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
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
              Icon(
                Icons.android,
                size: 50,
                color: Colors.blue,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.photo),
                label: Text('i am a Chip'),
              ),
              Divider(
                height: 5,
                indent: 50,
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5, // 阴影
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'i am a card',
                    style: textStyle,
                  )
                ),
              ),
              AlertDialog(
                title: Text('AlertDialog'),
                content: Text('内容'),

              )
            ],
          ),
        ),
      ),
    );
  }
}
