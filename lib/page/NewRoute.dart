import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TipRoute.dart';

class NewRoute extends StatefulWidget {
  static final String routerName = '/NewRoute';

  @override
  _NewRouteState createState() => _NewRouteState();
}

class _NewRouteState extends State<NewRoute> {
  String receiverMst = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewRoute'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('This is new route'),
            FlatButton(
              onPressed: () async {
                /*  var result = await Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return TipsRoute('This message is  from NewRoute!');
                }));*/
                var result = Navigator.pushNamed(context, TipsRoute.routerName,
                    arguments: '来自 newRoute 的数据');
                result.then((value) {
                  print("路由表：TipRoute  返回值： $value");
                  setState(() {
                    receiverMst = value;
                  });
                });
                //  _getBackValue(result);
              },
              child: Text('To TipRoute'),
              color: Colors.blue,
            ),
            Text(receiverMst,style: TextStyle(fontSize: 20,color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}
