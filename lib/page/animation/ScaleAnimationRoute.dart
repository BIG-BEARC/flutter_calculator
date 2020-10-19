import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  static final String routerName = '/ScaleAnimationRoute';
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
    //使用弹性曲线
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
    //图片宽高从0变到300
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animation)
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
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Image(
            image: AssetImage('images/time.jpeg'),
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      ),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage( Animation<double> animation)
      : super(listenable: animation);



  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: Image.asset("images/time.jpeg",
            width: animation.value,
            height: animation.value
        )
    );
  }

}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState1 createState() => new _ScaleAnimationRouteState1();
}

class _ScaleAnimationRouteState1 extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedImage(animation),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
