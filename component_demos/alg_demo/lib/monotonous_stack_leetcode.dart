import 'link_util.dart';

// 739. 每日温度
List<int> dailyTemperatures(List<int> temperatures) {
  List<int> stack = [];
  List<int> ans = List.filled(temperatures.length, 0);
  for (int i = 0; i < temperatures.length; i++) {
    while (stack.isNotEmpty && temperatures[stack.last] < temperatures[i]) {
      int index = stack.removeLast();
      ans[index] = i - index;
    }
    stack.add(i);
  }
  return ans;
}

// List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
//
// }

String removeKdigits(String num, int k) {
  List<int> stack = [];
  for (int i = 0; i < num.length; i++) {
    int val = int.tryParse(num[i])!;
    while (k > 0 && stack.isNotEmpty && stack.last > val) {
      stack.removeLast();
      k--;
    }

    stack.add(val);
  }

  while (k > 0) {
    k--;
    stack.removeLast();
  }

  while (stack.isNotEmpty && stack[0] == 0) {
    stack.removeAt(0);
  }

  return stack.isEmpty ? "0" : stack.join();
}

class MonotonousStackLeetcode implements ModulesMain {
  @override
  void main() {
    // print(dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]));
    // print(dailyTemperatures([30, 40, 50, 60]));
    // print(dailyTemperatures([30, 60, 90]));

    print(removeKdigits("112",1));
    print(removeKdigits("1432219", 3));
    print(removeKdigits("10200", 1));
    print(removeKdigits("10", 2));
  }
}
