
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OriginalPointEvent.dart';

class EventAndNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventAndNotificationState();
}

class _EventAndNotificationState extends State<EventAndNotification> {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
