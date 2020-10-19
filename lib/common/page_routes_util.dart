import 'package:flutter/material.dart';

class PageRoutesJump{
  static void pushTo(BuildContext context,String name,Widget route){
    Navigator.of(context).push(MaterialPageRoute(
        settings: RouteSettings(name: name),
        builder: (context) {
          return route;
        }));
  }
}