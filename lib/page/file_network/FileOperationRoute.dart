

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileOperationRouteState();
}

class _FileOperationRouteState extends State<FileOperationRoute> {
  int _counter=0;

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File("$dir/counter.txt");
  }

  Future<int> _readCounter() async {
    try {
      File  file = await _getLocalFile();
      String counterStr = await file.readAsString();
      return int.parse(counterStr);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }

  @override
  void initState() {
    super.initState();
    _readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文件操作'),
      ),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
        tooltip: 'Increment',
      ),
    );
  }
}
