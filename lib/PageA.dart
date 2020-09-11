
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageA extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageA'),
      ),
      body: Center(
        child: Text('I\'m Page A'),
      ),
    );
  }

}