import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/page/animation/ScaleAnimationRoute.dart';
import 'package:flutter_calculator/page/animation/StaggerAnimation.dart';

import 'AnimatedSwitcherCounterRoute.dart';
import 'HeroAnimationRoute.dart';

class AnimationDemo extends StatelessWidget {
  static final String routerName = '/AnimationDemo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.orange,
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton.icon(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(Route_ScaleAnimationRoute);
                    /*    Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      //使用渐隐渐入过渡,
                      opacity: animation,
                      child: PageB(), //路由B
                    );
                  },
                ),
              );*/
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleAnimationRoute(),
                          );
                        },
                        transitionDuration: Duration(microseconds: 1000)));
                  },
                  icon: Icon(Icons.ac_unit),
                  label: Text('ScaleAnimationRoute')),
              RaisedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return HeroAnimationRoute();
                    }));
                  },
                  icon: Icon(Icons.access_alarm),
                  label: Text('HeroAnimationRoute')),
              RaisedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                      return StaggerRoute();
                    }));
                  },
                  icon: Icon(Icons.email),
                  label: Text('Stagger Animation')),
              RaisedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                      return AnimatedSwitcherCounterRoute();
                    }));
                  },
                  icon: Icon(Icons.cloud_queue),
                  label: Text('AnimatedSwitcherCounterRoute')),
              RaisedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                      return ScaleAnimationRoute1();
                    }));
                  },
                  icon: Icon(Icons.directions_bike),
                  label: Text('ScaleAnimationRoute1')),
            ],
          ),
        ),
      ),
    );
  }
}
