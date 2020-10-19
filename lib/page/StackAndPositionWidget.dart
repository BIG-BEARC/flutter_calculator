import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackAndPositionWidget extends StatefulWidget{
  static final String routerName = '/StackAndPositionWidget';
  @override
  State<StatefulWidget> createState() =>_StackAndPositionWidgetState();
}

class _StackAndPositionWidgetState extends State<StackAndPositionWidget>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('StackAndPositionWidget'),
     ),
     body: ConstrainedBox(
       constraints: BoxConstraints.expand(),
       child: Stack(
         //指定未定位或部分定位widget的对齐方式
         alignment: Alignment.center,
       //  fit: StackFit.expand, //未定位widget占满Stack整个空间
         children: [
           Positioned(
             left: 18.0,
             child: Text("I am Jack"),
           ),
           Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
             color: Colors.red,
           ),

           Positioned(
             top: 18.0,
             child: Text("Your friend"),
           )
         ],
       ),
     ),
   );
  }

}