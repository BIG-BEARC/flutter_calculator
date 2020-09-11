
import 'package:flutter_calculator/CounterWidget.dart';
import 'package:flutter_calculator/EchoRoute.dart';
import 'package:flutter_calculator/NewRoute.dart';
import 'package:flutter_calculator/PageA.dart';
import 'package:flutter_calculator/PageB.dart';
import 'package:flutter_calculator/PageC.dart';
import 'package:flutter_calculator/TipRoute.dart';

const Route_PageA = "/PageA";
const Route_PageB = "/PageB";
const Route_PageC = "/PageC";
const Route_EchoRoute = "echo_route";
const Route_NewRoute = "new_route";
const Route_TipsRoute = "tip_route";
const Route_CounterWidget = "counterWidget_route";

var routePath = {
  '$Route_PageA': (context) => PageA(),
  '$Route_PageB': (context) => PageB(),
  '$Route_PageC': (context) => PageC(),
  '$Route_EchoRoute': (context) => EchoRoute(),
  '$Route_NewRoute': (context) => NewRoute(),
  '$Route_TipsRoute': (context) => TipsRoute("From_RouteManager"),
  '$Route_CounterWidget': (context) => CounterWidget(0),
};
