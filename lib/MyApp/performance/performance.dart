import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  final _itemCount = 10;
  final _itemHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
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

class DinnerPlates {
  late int _capacity;
  late List<List<int>> _stacks;
  late List<int> _availableStacks;

  DinnerPlates(int capacity) {
    _capacity = capacity;
    _stacks = [];
    _availableStacks = [];
  }

  void push(int val) {
    if (_availableStacks.isEmpty) {
      _availableStacks.add(_stacks.length);
      _stacks.add([]);
    }
    int index = _availableStacks[0];
    _stacks[index].add(val);
    if (_stacks[index].length == _capacity) {
      _availableStacks.removeAt(0);
    }
  }

  int pop() {
    while (_stacks.isNotEmpty && _stacks.last.isEmpty) {
      _stacks.removeLast();
    }
    if (_stacks.isEmpty) return -1;
    return popAtStack(_stacks.length - 1);
  }

  int popAtStack(int index) {
    if (index < 0 || index >= _stacks.length || _stacks[index].isEmpty)
      return -1;
    int? val = _stacks[index].removeLast();
    if (val == null) return -1;
    if (_stacks[index].length == _capacity - 1) {
      _availableStacks.add(index);
      _availableStacks.sort();
    }
    return val;
  }
}