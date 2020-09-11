import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/data/EchoRouteParams.dart';

class EchoRoute  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('EchoRoute Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("arguments : ${(args is EchoRouteParams?args.title:"null")}"),
              Text("arguments : ${(args is EchoRouteParams?args.content:"null")}"),
            ],
          ),
        ),
      ),
    );
  }

}