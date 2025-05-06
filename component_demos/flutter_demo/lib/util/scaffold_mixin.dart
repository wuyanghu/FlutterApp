import 'package:flutter/material.dart';

Widget buildScaffold(
  String title,
  Widget body,
) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: body,
  );
}
