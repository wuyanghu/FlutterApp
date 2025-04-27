import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_switch.dart';

class SwitchDemo extends StatefulWidget {
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
      body: CustomSwitch(
        value: _switchValue,
        onChanged: (bool newValue) {
          _switchValue = newValue;

          Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _switchValue = false;
              });
            }
          });
        },
      ),
    );
  }
}
