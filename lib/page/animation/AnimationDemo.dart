import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/manager/RouteManager.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton.icon(onPressed: (){
              Navigator.of(context).pushNamed(Route_ScaleAnimationRoute);
            }, icon: Icon(Icons.ac_unit), label: Text('ScaleAnimationRoute')),
            RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.access_alarm), label: Text('data')),
            RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.email), label: Text('data')),
            RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.cloud_queue), label: Text('data')),
          ],
        ),
      ),
    );
  }
}
