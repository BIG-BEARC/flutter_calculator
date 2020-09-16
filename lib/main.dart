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
  DateTime _lastPressedAt; //上次点击时间

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title ?? "Home page"),
          ),
          body: SingleChildScrollView(
            child: Wrap(
              runSpacing: 4.0,
              children: [
                Center(
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
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, Route_TapboxA),
                        },
                        child: Text('To TapboxA'),
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, Route_ParentWidget),
                        },
                        child: Text('父Widget管理子Widget的状态'),
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                          onPressed: () => {
                                Navigator.pushNamed(context, Route_ParentWidget)
                              },
                          child: Text('混合状态管理')),
                      FlatButton(
                          onPressed: () => {
                                Navigator.pushNamed(context, Route_NormalWidget)
                              },
                          child: Text('常用组件示例')),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Route_SwitchAndCheckBoxTestRoute);
                        },
                        child: Text('To SwitchAndCheckBoxTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Route_TextEditAndFormWidget);
                        },
                        child: Text('To TextEditAndFormWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Route_FormTestRoute);
                        },
                        child: Text('To FormTestRoute'),
                        color: Colors.blue,
                      ),
                      LinearProgressIndicator(
                        value: null,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Route_FlexLayoutTestRoute);
                        },
                        child: Text('To FlexLayoutTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Route_WrapAndFlowWidget);
                        },
                        child: Text('To WrapAndFlowWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Route_StackAndPositionWidget);
                        },
                        child: Text('To StackAndPositionWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Route_ContainerWidget);
                        },
                        child: Text('To ContainerWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Route_ScaffoldRoute);
                        },
                        child: Text('To ScaffoldRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Route_SingleChildScrollViewTestRoute);
                        },
                        child: Text('To SingleChildScrollViewTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Route_ListViewRoute);
                        },
                        child: Text('To ListViewRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Route_CustomScrollViewTestRoute);
                        },
                        child: Text('To CustomScrollViewTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Route_ScrollControllerTestRoute);
                        },
                        child: Text('To ScrollControllerTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Route_InheritedWidgetTestRoute);
                        },
                        child: Text('To InheritedWidgetTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Route_ProviderRoute);
                        },
                        child: Text('To ProviderRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Route_ThemeTestRoute);
                        },
                        child: Text('To ThemeTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Route_FutureBuilderAndStreamBuilder);
                        },
                        child: Text('To FutureBuilderAndStreamBuilder'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Route_DialogWidget);
                        },
                        child: Text('To DialogWidget'),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
        onWillPop: () async {
          //两次点击间隔超过1秒则重新计时
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
