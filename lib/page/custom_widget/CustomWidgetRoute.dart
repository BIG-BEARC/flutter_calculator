import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomWidget.dart';

class CustomWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomWidgetRouteState();
}

class _CustomWidgetRouteState extends State<CustomWidgetRoute> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组件'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton([Colors.orange, Colors.red], 50, double.infinity,
                Text("Submit"), BorderRadius.all(Radius.circular(4)), onTap),
            GradientButton([Colors.lightGreen, Colors.green[700]], 50, double.infinity,
                Text("Submit"), BorderRadius.all(Radius.circular(4)), onTap),
            GradientButton([Colors.lightBlue[300], Colors.blueAccent], 50, double.infinity,
                Text("Submit"), BorderRadius.all(Radius.circular(4)), onTap),
            GradientButton([Colors.pink[300], Colors.green], 50, double.infinity,
                Text("Submit"), BorderRadius.all(Radius.circular(4)), onTap),
            GradientButton([Colors.purple[300], Colors.pink], 50, double.infinity,
                Text("Submit"), BorderRadius.all(Radius.circular(4)), onTap),
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh, size: 50,),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh, size: 150.0,),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns += .2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  onTap() {
    print("button click");
  }
}
