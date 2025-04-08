import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeConsumingPage extends StatefulWidget {
  final String title;

  TimeConsumingPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return TimeConsumingPageState();
  }
}

class TimeConsumingPageState extends State<TimeConsumingPage> {
  bool _calculation_ended = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: RefreshProgressIndicator(),
            ),
            TextButton(
                onPressed: () async {
                  // _counter = await compute(decrement, 2000000000);
                  _counter = decrement(2000000000);
                  _calculation_ended = true;
                  setState(() {});
                },
                child: Text(_calculation_ended
                    ? 'calculation has ended'
                    : 'start calculating')),
          ],
        ),
      ),
    );
  }
}

int decrement(int count1) {
  // setState(() {
  //   _calculation_ended = false;
  // });
  print("开始计算");
  int count = count1;
  while (count > 0) {
    count--;
  }
  print("计算结束");
  return count;
}
