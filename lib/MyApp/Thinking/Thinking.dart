import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyApp/Help/Network/Request.dart';

class Thinking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThinkingState();
  }
}

class ThinkingState extends State {
  @override
  Widget build(BuildContext context) {
    ThinkingNetwork.allThinking({});
    return Scaffold(
        body: Center(
      child: Text("data"),
    ));
  }

  // void loadNew() async{
  //     await ThinkingNetwork.allThinking();

  // }
}
