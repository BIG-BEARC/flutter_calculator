
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drag.dart';
import 'OriginalPointEvent.dart';

class EventAndNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventAndNotificationState();
}

class _EventAndNotificationState extends State<EventAndNotification> {
  double _width = 500.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 25),
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return OriginalPointEvent();
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'To Original Point Event',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(2, 2),
                          blurRadius: 8.0),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Drag();
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'To Drag',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(2, 2),
                          blurRadius: 8.0),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return DragVertical();
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'To DragVertical',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(2, 2),
                          blurRadius: 8.0),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                //指定宽度，高度自适应
                child: Image(image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),width: _width,),
                onScaleUpdate: (ScaleUpdateDetails e){
                  setState(() {
                    //缩放倍数在0.8到10倍之间
                    _width = 200*e.scale.clamp(.8, 10.0);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


