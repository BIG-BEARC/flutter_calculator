
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    //启动动画(正向执行)
    _animationController.forward();
  }
@override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Image(
        image: AssetImage('images/time.jpeg'),
        width: _animation.value,
        height: _animation.value,
      ),
    ),
  );
  }
}
