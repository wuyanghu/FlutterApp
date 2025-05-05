import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  final String title;

  CustomSingleChildScrollView(this.title);

  final _itemCount = 10;
  final _itemHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < _itemCount; i++)
                Container(
                  padding: EdgeInsets.all(5),
                  height: _itemHeight,
                  color: Colors.teal.withOpacity(i / _itemCount),
                  child: CircularProgressIndicator(),
                )
            ]),
      ),
    );
  }
}
