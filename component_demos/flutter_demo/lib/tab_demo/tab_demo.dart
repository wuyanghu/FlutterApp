import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  static String route = 'TabDemo';

  const TabDemo({super.key});

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TabController tabController = TabController(length: 2, vsync: this);

    Future.delayed(Duration(seconds: 1), () {
      tabController = TabController(length: 2, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tab"),
      ),
    );
  }
}
