import 'package:flutter/material.dart';
import '../commons.dart';

class WrappedListsPage extends StatefulWidget {
  const WrappedListsPage({
    Key? key,
  }) : super(key: key);

  @override
  _WrappedListsPageState createState() => _WrappedListsPageState();
}

class _WrappedListsPageState extends State<WrappedListsPage> {
  List<ListView> innerLists = [];
  final numLists = 15;
  final numberOfItemsPerList = 1000;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scenario #1"),
      ),
      body: ListView.builder(
          itemCount: numLists,
          itemBuilder: (context, index) {
            return ListView.builder(
              itemCount: numberOfItemsPerList,
              itemBuilder: (BuildContext context, int index) => ColorRow(
                key: ValueKey<int>(index),
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            );
          }),
    );
  }
}
