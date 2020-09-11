import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Center(
        child: Text('I\'m Page C'),
      ),
    );
  }
  
}