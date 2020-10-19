import 'package:flutter/material.dart';

class UnKnownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '错误页面',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            '错误页面',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ));
  }
}
