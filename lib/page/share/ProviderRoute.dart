import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderRoute extends StatefulWidget {
  static final String routerName = '/ProviderRoute';
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        CartModel(),
          Column(
            children: [
        /*      Builder(builder: (BuildContext context){
                var cartModel = ChangeNotifierProvider.of<CartModel>(context);
                return Text("总价: ${cartModel.totalPrice}");
              }),*/
              Consumer<CartModel>(
                  builder: (context, cart)=> Text("总价: ${cart.totalPrice}")
              ),
              Builder(builder: (BuildContext context){
                print("RaisedButton build"); //在后面优化部分会用到
                return RaisedButton(onPressed: (){
                  //给购物车中添加商品，添加后总价会更新
                  ChangeNotifierProvider.of<CartModel>(context,listen: false)._add(Item(20.0, 1));
                },child: Text('添加商品'),);
              }),

            ],
          )
      ),
    );
  }
}

//**********************************InheritedProvider *****************************/
// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  //共享状态使用泛型
  final T data;
  //这里必须调用super构造函数，不然无法构造widget
  //抛 To return an empty space that causes the building widget to fill available room, return "Container()". To return an empty space that takes as little room as possible, return "Container(width: 0.0, height: 0.0)". 异常
  InheritedProvider(this.data, Widget child): super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }

}
//************************ChangeNotifierProvider******************************/
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;

  ChangeNotifierProvider(this.data,
      this.child,);

/*  static T of<T>(BuildContext context) {
    final provider =
    context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider.data;
  }*/
  //添加一个listen参数，表示是否建立依赖关系
  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget
    as InheritedProvider<T>;
    return provider.data;
  }
  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(widget.data, widget.child);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }
}


//**************************** Model ************************************//
class Item {
  double price;
  int count;

  Item(this.price, this.count);

}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => _items;

  // 购物车中商品的总价
  double get totalPrice => _items.fold(
      0, (previousValue, element) => (previousValue +
      element.count * element.price));

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void _add(Item value) {
    _items.add(value);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

//***********************************Consumer ************************/
// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget{
  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  Consumer({
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super();

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context),); //自动获取Model
  }

}