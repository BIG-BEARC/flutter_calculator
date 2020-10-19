import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  static final String routerName = '/SingleChildScrollViewTestRoute';
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollViewTestRoute'),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.apps), onPressed: () {})],
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child:  Column(
          children: str
              .split('')
              .map(
                (e) => Center(
                child: Text(
                  e,
                  textScaleFactor: 2.0,
                )),
          )
              .toList(),
        ),
      )),
    );
  }
}

