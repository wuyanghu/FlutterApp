import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CountModel {
  int count = 0;
}

class WP2_1Counter extends StatefulWidget {
  WP2_1Counter({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WP2_1CounterState createState() => _WP2_1CounterState();
}

extension StringToNumber on String {
  int toInt() {
    return int.parse(this);
  }
}

class _WP2_1CounterState extends State<WP2_1Counter> {
  CountModel countModel = CountModel();
  _WP2_1CounterState();

  void _incrementCounter() {
    '18'.toInt();

    setState(() {
      countModel.count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: CountWidget(this.countModel),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CountWidget extends StatefulWidget {
  CountModel countModel;
  CountWidget(this.countModel);
  @override
  State<StatefulWidget> createState() {
    return _CountState(this.countModel);
  }
}

class _CountState extends State<CountWidget> {
  CountModel countModel;
  _CountState(this.countModel);
  @override
  Widget build(BuildContext context) {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${countModel.count}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ));
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip route"),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // 打开`TipRoute`，并等待返回结果
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  // 路由参数
                  return TipRoute(text: "我是提示xxxx");
                },
              ),
            );
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
          child: Text("打开提示页"),
        ),
      ),
    );
  }
}

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {}),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    // print("命名路由传递参数:" + args);
    return Scaffold(
      appBar: AppBar(
        title: Text("EchoRoute route"),
      ),
      body: Center(
        child: Text("This is EchoRoute route"),
      ),
    );
  }
}
