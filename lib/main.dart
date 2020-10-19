import 'package:flutter/material.dart';
import 'package:flutter_calculator/page/EchoRoute.dart';
import 'package:flutter_calculator/page/NewRoute.dart';
import 'package:flutter_calculator/page/StackAndPositionWidget.dart';
import 'package:flutter_calculator/page/TapboxA.dart';
import 'package:flutter_calculator/router/app_routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'file:///D:/flutter_project/flutter_calculator/lib/router/RouteManager.dart';

import 'CounterWidget.dart';
import 'common/DemoLocalizationsDelegate.dart';
import 'data/EchoRouteParams.dart';
import 'page/ContainerWidget.dart';
import 'page/FlexLayoutTestRoute.dart';
import 'page/FormTestRoute.dart';
import 'page/NormalWidget.dart';
import 'page/ParentWidget.dart';
import 'page/ScaffoldRoute.dart';
import 'page/SwitchAndCheckBoxTestRoute.dart';
import 'page/TextEditAndFormWidget.dart';
import 'page/WrapAndFlowWidget.dart';
import 'page/animation/AnimationDemo.dart';
import 'page/custom_widget/CustomWidgetRoute.dart';
import 'page/event_notification/EventAndNotification.dart';
import 'page/file_network/FileAndNetWorkDemo.dart';
import 'page/scroll_widget/CustomScrollViewTestRoute.dart';
import 'page/scroll_widget/ListViewRoute.dart';
import 'page/scroll_widget/ScrollControllerTestRoute.dart';
import 'page/scroll_widget/SingleChildScrollViewTestRoute.dart';
import 'page/share/DialogWidgetRoute.dart';
import 'page/share/FutureBuilderAndStreamBuilder.dart';
import 'page/share/ProviderRoute.dart';
import 'page/share/ShareDataWidget.dart';
import 'page/share/ThemeTestRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //localizationsDelegates列表中的元素是生成本地化值集合的工厂。
      // GlobalMaterialLocalizations.delegate 为Material 组件库提供的本地化的字符串和其他值，
      // 它可以使Material 组件支持多语言。
      localizationsDelegates: [
        //本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 注册我们的Delegate
        DemoLocalizationsDelegate(),
      ],
      //supportedLocales也接收一个Locale数组，表示我们的应用支持的语言列表，在本例中我们的应用只支持美国英语和中文简体两种语言。
      //Locale类是用来标识用户的语言环境的，它包括语言和国家两个标志如：
      // const Locale('zh', 'CN') // 中文简体
      // 我们始终可以通过以下方式来获取应用的当前区域Locale：
      // Locale myLocale = Localizations.localeOf(context);
      supportedLocales: [
        Locale('en', 'US'), // 美国英语
        Locale('zh', 'CN'), // 中文简体
      ],
      //手动指定locale
      //locale: const Locale('en', 'US'),
      title: 'Flutter Demo',
      //名为"/"的路由作为应用的home(首页)
      // initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //注册路由表
      routes: Routers.routes,
      initialRoute:Routers.initialRoute,
      onUnknownRoute: Routers.unKnownRoute,
      onGenerateRoute: Routers.generateRoute,
      // navigatorObservers: [AppAnalysis()],
    );
  }
}

class MyHomePage extends StatefulWidget {
  static final String routerName = '/';
  final String title = 'Flutter Demo Home Page';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            //   title: Text(widget.title ?? "Home page"),
            //使用Locale title
            title: Text(DemoLocalizations.of(context).title),
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
                          Locale myLocale = Localizations.localeOf(context);
                          Fluttertoast.showToast(
                              msg:
                                  myLocale.languageCode + myLocale.countryCode);
                          Navigator.pushNamed(context, NewRoute.routerName);
                        },
                        child: Text('open a new route page'),
                        color: Colors.blue,
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, EchoRoute.routerName,
                              arguments: EchoRouteParams(
                                  "Title form Home", "I am content argument")),
                        },
                        child: Text('To EchoRoute'),
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, CounterWidget.routerName,
                              arguments: 1),
                        },
                        child: Text('To CounterWidget'),
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, TapboxA.routerName),
                        },
                        child: Text('To TapboxA'),
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, ParentWidget.routerName),
                        },
                        child: Text('父Widget管理子Widget的状态'),
                        textColor: Colors.blue,
                      ),
                      FlatButton(
                          onPressed: () => {
                                Navigator.pushNamed(context, ParentWidget.routerName)
                              },
                          child: Text('混合状态管理')),
                      FlatButton(
                          onPressed: () => {
                                Navigator.pushNamed(context, NormalWidget.routerName)
                              },
                          child: Text('常用组件示例')),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SwitchAndCheckBoxTestRoute.routerName);
                        },
                        child: Text('To SwitchAndCheckBoxTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, TextEditAndFormWidget.routerName);
                        },
                        child: Text('To TextEditAndFormWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, FormTestRoute.routerName);
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
                              context, FlexLayoutTestRoute.routerName);
                        },
                        child: Text('To FlexLayoutTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, WrapAndFlowWidget.routerName);
                        },
                        child: Text('To WrapAndFlowWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, StackAndPositionWidget.routerName);
                        },
                        child: Text('To StackAndPositionWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ContainerWidget.routerName);
                        },
                        child: Text('To ContainerWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ScaffoldRoute.routerName);
                        },
                        child: Text('To ScaffoldRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SingleChildScrollViewTestRoute.routerName);
                        },
                        child: Text('To SingleChildScrollViewTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ListViewRoute.routerName);
                        },
                        child: Text('To ListViewRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(CustomScrollViewTestRoute.routerName);
                        },
                        child: Text('To CustomScrollViewTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ScrollControllerTestRoute.routerName);
                        },
                        child: Text('To ScrollControllerTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(InheritedWidgetTestRoute.routerName);
                        },
                        child: Text('To InheritedWidgetTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ProviderRoute.routerName);
                        },
                        child: Text('To ProviderRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ThemeTestRoute.routerName);
                        },
                        child: Text('To ThemeTestRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(FutureBuilderAndStreamBuilder.routerName);
                        },
                        child: Text('To FutureBuilderAndStreamBuilder'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(DialogWidget.routerName);
                        },
                        child: Text('To DialogWidget'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(EventAndNotification.routerName);
                        },
                        child: Text('To EventAndNotification'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AnimationDemo.routerName);
                        },
                        child: Text('To AnimationDemo'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(FileAndNetWorkDemo.routerName);
                        },
                        child: Text('To FileAndNetWorkDemo'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(CustomWidgetRoute.routerName);
                          Fluttertoast.showToast(msg: 'To CustomWidgetRoute');
                        },
                        child: Text('To CustomWidgetRoute'),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          /*  Navigator.of(context)
                              .pushNamed(Route_PageRoute);
                          Fluttertoast.showToast(msg: 'To PageRoute');*/
                        },
                        child: Text('To PageRoute'),
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
