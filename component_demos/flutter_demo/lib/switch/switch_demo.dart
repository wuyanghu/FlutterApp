import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_switch.dart';

class SwitchDemo extends StatefulWidget {
  static String route = 'SwitchDemo';

  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("switch"),
      ),
      body: Column(children: [
        CustomSwitch(
          value: _switchValue,
          onChanged: (bool newValue) {
            _switchValue = newValue;
            setState(() {

            });

            Future.delayed(Duration(seconds: 1), () {
              if (mounted) {
                setState(() {
                  _switchValue = false;
                });
              }
            });
          },
        ),
        WidgetUpdeate(text: "测试参数不变时，widget是否更新"),
        const ConstWidgt(),
      ],),
    );
  }
}

///验证widget参数不改变
class WidgetUpdeate extends StatefulWidget {
  final String text;
  const WidgetUpdeate({super.key,this.text = ''});

  @override
  State<WidgetUpdeate> createState() => _WidgetUpdeateState();
}

class _WidgetUpdeateState extends State<WidgetUpdeate> {
  @override
  Widget build(BuildContext context) {
    print("_WidgetUpdeateState build");
    return Text(widget.text);
  }

  @override
  void didUpdateWidget(covariant WidgetUpdeate oldWidget) {
    print("_WidgetUpdeateState didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
}


class ConstWidgt extends StatefulWidget {
  const ConstWidgt({super.key});

  @override
  State<ConstWidgt> createState() => _ConstWidgtState();
}

class _ConstWidgtState extends State<ConstWidgt> {
  @override
  Widget build(BuildContext context) {
    return Text("const widget");
  }

  @override
  void didUpdateWidget(covariant ConstWidgt oldWidget) {
    print("_ConstWidgtState didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
}

