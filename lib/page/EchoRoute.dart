import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/data/EchoRouteParams.dart';
///参数传递练习2
class EchoRoute  extends StatelessWidget{
  static final String routerName = '/EchoRoute';
  @override
  Widget build(BuildContext context) {
    // 1.获取数据
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