import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static const String route = 'ListPage';

  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       SizedBox(
    //         height: MediaQuery.of(context).padding.top,
    //       ),
    //       Container(
    //         color: Colors.green,
    //         child: Text("ListView"),
    //       ),
    //       Expanded(child: Builder(builder: (context) {
    //         print("PaddingTop: ${MediaQuery.of(context).padding.top}");
    //         return ListView(
    //           children: List.generate(
    //             1,
    //             (index) => LayoutBuilder(builder: (context, constraints) {
    //               print("constraints = $constraints");
    //               return Container(
    //                 height: 80,
    //                 color: index.isEven ? Colors.blue : Colors.green,
    //                 alignment: Alignment.center,
    //                 child: Text('Item $index',
    //                     style: const TextStyle(color: Colors.white)),
    //               );
    //             }),
    //           ),
    //         );
    //       })),
    //     ],
    //   ),
    // );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            const TabBar(
              tabs: [
                Tab(text: '默认'),
                Tab(text: 'SafeArea'),
                Tab(text: 'padding.zero'),
                Tab(text: 'extendBody'),
              ],
            ),
            Expanded(
              child: const TabBarView(
                children: [
                  // 场景1：默认 ListView（顶部有空白）
                  DefaultListView(),

                  // 场景2：外包 SafeArea（明显留白）
                  SafeAreaListView(),

                  // 场景3：padding 设置为 zero（无空白）
                  ZeroPaddingListView(),

                  // 场景4：Scaffold.extendBodyBehindAppBar + MediaQuery.removePadding
                  ExtendBodyListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultListView extends StatelessWidget {
  const DefaultListView({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    print('👀 顶部 padding: ${padding.top}');

    return ListView(
      children: List.generate(
        1,
        (index) => LayoutBuilder(builder: (context, constraints) {
          print("constraints = $constraints");
          return Container(
            height: 80,
            color: index.isEven ? Colors.blue : Colors.green,
            alignment: Alignment.center,
            child: Text('Item $index',
                style: const TextStyle(color: Colors.white)),
          );
        }),
      ),
    );
  }
}

class SafeAreaListView extends StatelessWidget {
  const SafeAreaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: List.generate(
          10,
          (index) => Container(
            height: 80,
            color: index.isEven ? Colors.orange : Colors.red,
            alignment: Alignment.center,
            child: Text('Item $index',
                style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class ZeroPaddingListView extends StatelessWidget {
  const ZeroPaddingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: List.generate(
        10,
        (index) => Container(
          height: 80,
          color: index.isEven ? Colors.purple : Colors.indigo,
          alignment: Alignment.center,
          child:
              Text('Item $index', style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class ExtendBodyListView extends StatelessWidget {
  const ExtendBodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('ExtendBody 效果'),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: List.generate(
            10,
            (index) => Container(
              height: 80,
              color: index.isEven ? Colors.teal : Colors.cyan,
              alignment: Alignment.center,
              child: Text('Item $index',
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
