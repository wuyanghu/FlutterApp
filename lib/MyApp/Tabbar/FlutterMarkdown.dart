import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class FlutterMarkdown extends StatelessWidget {
  const FlutterMarkdown({Key key, String content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: rootBundle.loadString('assets/markdown.md'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // var en = EncryptUtil.encrypt("test");
          // print("11-${en}");
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data);
          } else {
            return Center(
              child: Text("加载中..."),
            );
          }
        },
      ),
    );
  }
}
