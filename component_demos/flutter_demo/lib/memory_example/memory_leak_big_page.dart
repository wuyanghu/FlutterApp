import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class BigMemoryPage extends StatefulWidget {
  static String route = 'BigMemoryPage';

  const BigMemoryPage({super.key});

  @override
  State<BigMemoryPage> createState() => _BigMemoryPageState();
}

List<Uint8List> largeBuffer = [];

class _BigMemoryPageState extends State<BigMemoryPage> {

  @override
  Widget build(BuildContext context) {
    void bigMemoryLeak() {
      largeBuffer.add(Uint8List(100 * 1024 * 1024)); // 10MB
    }

    void disposeBigMemory() {
      largeBuffer.clear();
    }

    return buildScaffold(
        "大内存泄漏",
        Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: bigMemoryLeak,
                child: Text("分配内存"),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: disposeBigMemory,
                child: Text("释放内存"),
              )
            ],
          ),
        ));
  }
}
