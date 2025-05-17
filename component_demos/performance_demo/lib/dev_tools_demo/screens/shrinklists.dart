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
  final numberOfItemsPerList = 200;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numLists; i++) {
      final innerList = <ColorRow>[];
      for (int j = 0; j < numberOfItemsPerList; j++) {
        innerList.add(const ColorRow());
      }
      innerLists.add(
        ListView.builder(
          itemCount: numberOfItemsPerList,
          itemBuilder: (BuildContext context, int index) => innerList[index],
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scenario #1"),
      ),
      body: ListView.builder(
          itemCount: numLists,
          itemBuilder: (context, index) => innerLists[index]),
    );
  }
}
