import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 35),
          child: Center(
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    /*      return ScaleTransition(
                      scale: animation,
                      child: child,
                    );*/
                    /*   return FadeTransition(
                      opacity: animation,
                      child: child,
                    );*/
                    var tween =
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                    return MySlideTransition(
                      child: child,
                      position: tween.animate(animation),
                    );
                  },
                  child: Text(
                    "$_count",
                    //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                    key: ValueKey(_count),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _count += 1;
                    });
                  },
                  child: Text(
                    '+1',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///AnimatedSwitcher高级用法 ,自定义动画？
class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })
      : assert(position != null),
        super(key: key, listenable: position) ;

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }

    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
