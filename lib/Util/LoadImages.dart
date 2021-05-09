import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

class LoadImage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/wechat.png'),
        ),
      ),
    );
  }
}

class LoadImage2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image.asset('images/wechat.png');
  }
}
