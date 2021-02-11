import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

/// 不能直接使用 HeroAnimation，需要用 MaterialApp 包裹
void main() => runApp(MaterialApp(
  home: HeroAnimation(),
));

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);
  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        // tag：必须，用于关联两个hero动画的标识
        tag: photo,
        child: Material(
          color: Colors.transparent,
          // 按钮
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Heo Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo:
          'https://shopstatic.vivo.com.cn/vivoshop/commodity/10/10006210_1610522662214_750x750.png.webp',
          width: 300.0,
          onTap: () {
            /// 构建路由
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo:
                    'https://shopstatic.vivo.com.cn/vivoshop/commodity/10/10006210_1610522662214_750x750.png.webp',
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
