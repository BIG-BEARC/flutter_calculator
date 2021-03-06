import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioFutureBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DioFutureBuilderRouteState();
}

class _DioFutureBuilderRouteState extends State<DioFutureBuilderRoute> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return ListView(
                children: response.data.map<Widget>((e) =>
                    ListTile(title: Text(e["full_name"]))
                ).toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          },
          future: _dio.get('https://api.github.com/orgs/flutterchina/repos'),
        ),
      ),
    );
  }
}
