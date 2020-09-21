import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/page/file_network/FileOperationRoute.dart';

import 'DioFutureBuilderRoute.dart';

class FileAndNetWorkDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文件和网络请求'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton.icon(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (_){
                  return FileOperationRoute();
                }));
              },
              icon: Icon(Icons.insert_drive_file),
              label: Text('文件操作'),
            ),
            RaisedButton.icon(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (_){
                  return DioFutureBuilderRoute();
                }));
              },
              icon: Icon(Icons.refresh),
              label: Text('Http请求'),
            ),
          ],
        ),
      ),
    );
  }
  
}