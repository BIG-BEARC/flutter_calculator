import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageB'),
      ),
      body: Center(
        child: Text('I\'m Page B'),
      ),
    );
  }
}
