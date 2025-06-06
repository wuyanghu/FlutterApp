import 'shopping_provider.dart';
import 'package:flutter/material.dart';

// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  Consumer({
    Key? key,
    required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}

class Item {
  Item(this.price, this.count);
  double price; //商品单价
  int count; // 商品份数
}

class CartModel extends CustomChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  // UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  static String route = 'ProviderRoute';

  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    print("_ProviderRouteState build");
    return Scaffold(
        appBar: AppBar(
          title: Text("provider"),
        ),
        body: Center(
          child: ChangeNotifierProvider<CartModel>(
            data: CartModel(),
            child: Builder(builder: (context) {
              print("_ProviderRouteState build");
              return Column(
                children: <Widget>[
                  Consumer<CartModel>(
                      builder: (context, cart) =>
                          Text("总价: ${cart?.totalPrice}")),
                  // Builder(builder: (context) {
                  //   var cart = ChangeNotifierProvider.of<CartModel>(context);
                  //   return Text("总价: ${cart!.totalPrice}");
                  // }),
                  SubWidget(),
                  Builder(builder: (context) {
                    print("RaisedButton build"); //在后面优化部分会用到
                    return ElevatedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        //给购物车中添加商品，添加后总价会更新
                        // listen 设为false，不建立依赖关系
                        ChangeNotifierProvider.of<CartModel>(context,
                                listen: false)
                            ?.add(Item(20.0, 1));
                      },
                    );
                  }),
                ],
              );
            }),
          ),
        ));
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("SubWidget build");
    return Text("SubWidget");
  }
}
