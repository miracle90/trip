import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  // AnimationStatus animationStatus;
  // double animationValue;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
    // ..addListener(() {
    //   setState(() {
    //     animationValue = animation.value;
    //   });
    // })
    // ..addStatusListener((AnimationStatus state) {
    //   setState(() {
    //     animationStatus = state;
    //   });
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
    // return Container(
    //   margin: EdgeInsets.only(top: 50),
    //   child: Column(
    //     children: <Widget>[
    //       GestureDetector(
    //         onTap: () {
    //           controller.reset();
    //           controller.forward();
    //         },
    //         child: Text(
    //           'Start',
    //           textDirection: TextDirection.ltr,
    //         ),
    //       ),
    //       Text(
    //         'State: ' + animationStatus.toString(),
    //         textDirection: TextDirection.ltr,
    //       ),
    //       Text(
    //         'Value: ' + animationValue.toString(),
    //         textDirection: TextDirection.ltr,
    //       ),
    //       Container(
    //         height: animation.value,
    //         width: animation.value,
    //         child: FlutterLogo(),
    //       )
    //     ],
    //   ),
    // );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}