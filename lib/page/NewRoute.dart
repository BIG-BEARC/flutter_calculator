import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
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
                var result =  await Navigator.pushNamed(context, "tip_route");
                print("路由表：TipRoute  返回值： $result");
              //  _getBackValue(result);
            },
          /*    onPressed: ()=>{
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return TipsRoute('This message is  from NewRoute !');
                }))
              },*/
              child: Text('To TipRoute'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }


}
