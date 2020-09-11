import 'package:flutter/material.dart';
import 'package:flutter_calculator/manager/RouteManager.dart';

import 'data/EchoRouteParams.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //名为"/"的路由作为应用的home(首页)
     // initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //注册路由表
  /*    routes: {
        '/': (context) => MyHomePage(), //注册首页路由
        'new_route': (context) => NewRoute(),
        'tip_route': (context) => TipsRoute('From home'),
        'echo_route': (context) => EchoRoute(),
      },*/
      routes: routePath,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Home page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              onPressed: () {
                /*   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return NewRoute();
                }));*/
                Navigator.pushNamed(context, Route_NewRoute);
              },
              child: Text('open a new route page'),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushNamed(context, 'echo_route',
                    arguments: EchoRouteParams(
                        "Title form Home", "I am content argument")),
              },
              child: Text('To EchoRoute'),
              textColor: Colors.blue,
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushNamed(context, Route_CounterWidget,
                    arguments: 1),
              },
              child: Text('To CounterWidget'),
              textColor: Colors.blue,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
