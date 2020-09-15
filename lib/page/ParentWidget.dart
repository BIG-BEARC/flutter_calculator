import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/page/TapboxB.dart';
import 'package:flutter_calculator/page/TapboxC%20.dart';
/// 父Widget管理子Widget的状态 ,主要通过回调管理
class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ParentWidgetState();

}
class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;
  void _handleTapboxChange(bool newValue){
    setState(() {
    _active =newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParentWidget'),
      ),
      body:  Container(
        child: Column(
          children: [
            TapboxB(
              _active,
              _handleTapboxChange,
            ),
            TapboxC(_active, _handleTapboxChange)
          ],
        )

      ),
    );
  }

}