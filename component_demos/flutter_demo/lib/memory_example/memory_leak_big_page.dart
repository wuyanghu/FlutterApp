import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class BigMemoryPage extends StatefulWidget {
  const BigMemoryPage({super.key});

  @override
  State<BigMemoryPage> createState() => _BigMemoryPageState();
}

class _BigMemoryPageState extends State<BigMemoryPage> {
  List<Uint8List> largeBuffer = [];

  @override
  Widget build(BuildContext context) {
    void bigMemoryLeak() {
      largeBuffer.add(Uint8List(10 * 1024 * 1024)); // 10MB
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
