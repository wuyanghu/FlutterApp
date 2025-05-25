import 'dart:collection';
import 'dart:math';

import 'package:alg_demo/sliding_window_leetcode.dart';
import 'package:alg_demo/sort_leetcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'array_leetcode.dart';
import 'dfs_leetcode.dart';
import 'double_pointer_leetcode.dart';
import 'greed_leetcode.dart';
import 'link_leetcode.dart';
import 'link_util.dart';
import 'monotonous_stack_leetcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ALG'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // GreedLeetcode().main();
    LinkLeetcode().main();
    // MonotonousStackLeetcode().main();
    // DfsLeetcode().main();
    // DoublePointerLeetcode().main();
    // SlidingWindowLeetcode().main();
    // SortLeetcode().main();
    // ArrayLeetCode().main();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
