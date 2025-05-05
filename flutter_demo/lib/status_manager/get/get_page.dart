import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_logic.dart';
import 'get_state.dart';

class GetPage extends StatelessWidget {
  GetPage({Key? key}) : super(key: key);

  final GetLogic logic = Get.put(GetLogic());
  final GetState state = Get.find<GetLogic>().state;

  @override
  var count = 0.obs;

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("$count")),
            GetBuilder<GetLogic>(
                builder: (GetLogic logic) => Text("${logic.state.count}"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          count++;
          Get.find<GetLogic>().add();
        },
      ));
}
