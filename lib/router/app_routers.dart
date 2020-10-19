import 'package:flutter/material.dart';
import 'package:flutter_calculator/main.dart';
import 'package:flutter_calculator/page/ContainerWidget.dart';
import 'package:flutter_calculator/page/EchoRoute.dart';
import 'package:flutter_calculator/page/FlexLayoutTestRoute.dart';
import 'package:flutter_calculator/page/FormTestRoute.dart';
import 'package:flutter_calculator/page/NewRoute.dart';
import 'package:flutter_calculator/page/NormalWidget.dart';
import 'package:flutter_calculator/page/ScaffoldRoute.dart';
import 'package:flutter_calculator/page/StackAndPositionWidget.dart';
import 'package:flutter_calculator/page/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_calculator/page/TapboxA.dart';
import 'package:flutter_calculator/page/ParentWidget.dart';
import 'package:flutter_calculator/page/TextEditAndFormWidget.dart';
import 'package:flutter_calculator/page/TipRoute.dart';
import 'package:flutter_calculator/page/WrapAndFlowWidget.dart';
import 'package:flutter_calculator/page/animation/AnimationDemo.dart';
import 'package:flutter_calculator/page/animation/ScaleAnimationRoute.dart';
import 'package:flutter_calculator/page/custom_widget/CustomWidgetRoute.dart';
import 'package:flutter_calculator/page/error/unkonwn_page.dart';
import 'package:flutter_calculator/page/event_notification/EventAndNotification.dart';
import 'package:flutter_calculator/page/file_network/FileAndNetWorkDemo.dart';
import 'package:flutter_calculator/page/scroll_widget/CustomScrollViewTestRoute.dart';
import 'package:flutter_calculator/page/scroll_widget/ListViewRoute.dart';
import 'package:flutter_calculator/page/scroll_widget/ScrollControllerTestRoute.dart';
import 'package:flutter_calculator/page/scroll_widget/SingleChildScrollViewTestRoute.dart';
import 'package:flutter_calculator/page/share/DialogWidgetRoute.dart';
import 'package:flutter_calculator/page/share/FutureBuilderAndStreamBuilder.dart';
import 'package:flutter_calculator/page/share/ProviderRoute.dart';
import 'package:flutter_calculator/page/share/ShareDataWidget.dart';
import 'package:flutter_calculator/page/share/ThemeTestRoute.dart';

import '../CounterWidget.dart';

class Routers {
  static final String initialRoute = MyHomePage.routerName;

  static RouteFactory unKnownRoute = (setting) {
    return MaterialPageRoute(builder: (ctx) {
      return UnKnownPage();
    });
  };

  static RouteFactory generateRoute = (setting) {
    if (setting.name == TipsRoute.routerName) {
      return MaterialPageRoute(builder: (ctx) {
        return TipsRoute(setting.arguments);
      });
    } else if (setting.name == CounterWidget.routerName) {
      return MaterialPageRoute(builder: (ctx) {
        return CounterWidget(setting.arguments);
      });
    } else if (setting.name == TipsRoute.routerName) {
      return MaterialPageRoute(builder: (ctx) {
        return TipsRoute(setting.arguments);
      });
    }
    return null;
  };

  Route _buildPage(Widget widget) {
    return MaterialPageRoute(builder: (ctx) {
      return widget;
    });
  }

  static final Map<String, WidgetBuilder> routes = {
    MyHomePage.routerName: (ctx) => MyHomePage(),
    NewRoute.routerName: (ctx) => NewRoute(),
    EchoRoute.routerName: (ctx) => EchoRoute(),
    TapboxA.routerName: (ctx) => TapboxA(),

    NormalWidget.routerName: (ctx) => NormalWidget(),
    SwitchAndCheckBoxTestRoute.routerName: (ctx) =>
        SwitchAndCheckBoxTestRoute(),
    TextEditAndFormWidget.routerName: (ctx) => TextEditAndFormWidget(),
    FormTestRoute.routerName: (ctx) => FormTestRoute(),
    FlexLayoutTestRoute.routerName: (ctx) => FlexLayoutTestRoute(),
    WrapAndFlowWidget.routerName: (ctx) => WrapAndFlowWidget(),
    ParentWidget.routerName: (ctx) => ParentWidget(),
    CustomWidgetRoute.routerName: (ctx) => CustomWidgetRoute(),
    FileAndNetWorkDemo.routerName: (ctx) => FileAndNetWorkDemo(),
    ScaleAnimationRoute.routerName: (ctx) => ScaleAnimationRoute(),
    AnimationDemo.routerName: (ctx) => AnimationDemo(),
    EventAndNotification.routerName: (ctx) => EventAndNotification(),
    DialogWidget.routerName: (ctx) => DialogWidget(),
    FutureBuilderAndStreamBuilder.routerName: (ctx) =>
        FutureBuilderAndStreamBuilder(),
    ThemeTestRoute.routerName: (ctx) => ThemeTestRoute(),
    ProviderRoute.routerName: (ctx) => ProviderRoute(),
    InheritedWidgetTestRoute.routerName: (ctx) => InheritedWidgetTestRoute(),
    ScrollControllerTestRoute.routerName: (ctx) => ScrollControllerTestRoute(),
    CustomScrollViewTestRoute.routerName: (ctx) => CustomScrollViewTestRoute(),
    ListViewRoute.routerName: (ctx) => ListViewRoute(),
    SingleChildScrollViewTestRoute.routerName: (ctx) =>
        SingleChildScrollViewTestRoute(),
    ScaffoldRoute.routerName: (ctx) => ScaffoldRoute(),
    ContainerWidget.routerName: (ctx) => ContainerWidget(),
    StackAndPositionWidget.routerName: (ctx) => StackAndPositionWidget(),
  };
}
