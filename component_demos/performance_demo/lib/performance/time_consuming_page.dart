import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            if (!_calculation_ended)
              Container(
                child: RefreshProgressIndicator(),
              ),
            TextButton(
                onPressed: () async {
                  final transaction = Sentry.startTransaction(
                    'load-TimeConsumingPageState-onPressed',
                    'ui.load',
                    bindToScope: true,
                  );

                  // _counter = await compute(decrement, 2000000000);
                  setState(() {
                    _counter = decrement(2000000000);
                    _calculation_ended = true;
                  });

                  transaction.finish(status: const SpanStatus.ok());
                },
                child: Text(_calculation_ended
                    ? 'calculation has ended $_counter'
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
