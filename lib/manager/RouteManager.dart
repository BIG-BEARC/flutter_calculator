import 'package:flutter_calculator/CounterWidget.dart';
import 'package:flutter_calculator/page/ContainerWidget.dart';
import 'package:flutter_calculator/page/FlexLayoutTestRoute.dart';
import 'package:flutter_calculator/page/FormTestRoute.dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/scroll_widget/ListViewRoute.dart';
import 'package:flutter_calculator/page/NewRoute.dart';
import 'package:flutter_calculator/page/NormalWidget.dart';
import 'package:flutter_calculator/page/ParentWidget.dart';
import 'package:flutter_calculator/page/ScaffoldRoute.dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/scroll_widget/SingleChildScrollViewTestRoute.dart';
import 'package:flutter_calculator/page/StackAndPositionWidget.dart';
import 'package:flutter_calculator/page/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_calculator/page/TapboxA.dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/EchoRoute.dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/TapboxC .dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/TapboxB.dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/TipRoute.dart';
import 'package:flutter_calculator/page/TextEditAndFormWidget.dart';
import 'package:flutter_calculator/page/WrapAndFlowWidget.dart';
import 'package:flutter_calculator/page/scroll_widget/CustomScrollViewTestRoute.dart';
import 'package:flutter_calculator/page/scroll_widget/ScrollControllerTestRoute.dart';

/// 路由管理类

const Route_TapboxA = "/TapboxA";
const Route_TapboxB = "/TapboxB";
const Route_TapboxC  = "/TapboxC ";
const Route_EchoRoute = "echo_route";
const Route_NewRoute = "new_route";
const Route_TipsRoute = "tip_route";
const Route_CounterWidget = "counterWidget_route";
const Route_ParentWidget = "/parentWidget_route";
const Route_NormalWidget = "/normalWidget_route";
const Route_SwitchAndCheckBoxTestRoute = "/SwitchAndCheckBoxTestRoute";
const Route_TextEditAndFormWidget = "/TextEditAndFormWidget";
const Route_FormTestRoute = "/FormTestRoute";
const Route_FlexLayoutTestRoute = "/FlexLayoutTestRoute";
const Route_WrapAndFlowWidget = "/WrapAndFlowWidget";
const Route_StackAndPositionWidget = "/StackAndPositionWidget";
const Route_ContainerWidget = "/ContainerWidget";
const Route_ScaffoldRoute = "/ScaffoldRoute";
const Route_SingleChildScrollViewTestRoute = "/SingleChildScrollViewTestRoute";
const Route_ListViewRoute = "/ListViewRoute";
const Route_CustomScrollViewTestRoute = "/CustomScrollViewTestRoute";
const Route_ScrollControllerTestRoute = "/ScrollControllerTestRoute";

var routePath = {
  '$Route_TapboxA': (context) => TapboxA(),
  '$Route_ParentWidget': (context) => ParentWidget(),
 // '$Route_TapboxB': (context) => TapboxB(),
//  '$Route_TapboxC ': (context) => TapboxC (),
  '$Route_EchoRoute': (context) => EchoRoute(),
  '$Route_NewRoute': (context) => NewRoute(),
  '$Route_TipsRoute': (context) => TipsRoute("From_RouteManager"),
  '$Route_CounterWidget': (context) => CounterWidget(0),
  '$Route_NormalWidget': (context) => NormalWidget(),
  '$Route_SwitchAndCheckBoxTestRoute': (context) => SwitchAndCheckBoxTestRoute(),
  '$Route_TextEditAndFormWidget': (context) => TextEditAndFormWidget(),
  '$Route_FormTestRoute': (context) => FormTestRoute(),
  '$Route_FlexLayoutTestRoute': (context) => FlexLayoutTestRoute(),
  '$Route_WrapAndFlowWidget': (context) => WrapAndFlowWidget(),
  '$Route_StackAndPositionWidget': (context) => StackAndPositionWidget(),
  '$Route_ContainerWidget': (context) => ContainerWidget(),
  '$Route_ScaffoldRoute': (context) => ScaffoldRoute(),
  '$Route_SingleChildScrollViewTestRoute': (context) => SingleChildScrollViewTestRoute(),
  '$Route_ListViewRoute': (context) => ListViewRoute(),
  '$Route_CustomScrollViewTestRoute': (context) => CustomScrollViewTestRoute(),
  '$Route_ScrollControllerTestRoute': (context) => ScrollControllerTestRoute(),
};
