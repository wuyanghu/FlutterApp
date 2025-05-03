import 'package:demo/status_manager/get/get_state.dart';
import 'package:get/get.dart';

class GetLogic extends GetxController {
  final GetState state = GetState();

  void add() {
    state.count += 1;
    update();
  }
}
