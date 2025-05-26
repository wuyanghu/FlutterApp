import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class LeakSingleChildViewPage extends StatefulWidget {
  static String route = 'LeakSingleChildViewPage';

  const LeakSingleChildViewPage({super.key});

  @override
  State<LeakSingleChildViewPage> createState() =>
      _LeakSingleChildViewPageState();
}

class _LeakSingleChildViewPageState extends State<LeakSingleChildViewPage> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "single",
        SingleChildScrollView(
          child: Column(
            children: List.generate(1000, (index) {
              return ListTile(title: Text('Item $index'));
            }),
          ),
        ));
  }
}
