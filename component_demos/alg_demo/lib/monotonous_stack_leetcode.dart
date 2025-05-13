import 'dart:math';

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

List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
  List<int> stack = [];
  Map<int, int> map = {};

  for (int i = 0; i < nums2.length; i++) {
    while (stack.isNotEmpty && stack.last < nums2[i]) {
      int val = stack.removeLast();
      map[val] = nums2[i];
    }
    stack.add(nums2[i]);
  }

  List<int> ans = List.filled(nums1.length, -1);
  for (int i = 0; i < nums1.length; i++) {
    ans[i] = map[nums1[i]] ?? -1;
  }
  return ans;
}

// 503. 下一个更大元素 II
List<int> nextGreaterElements(List<int> nums) {
  List<int> stack = [];
  List<int> ans = List.filled(nums.length, -1);

  int count = 0;
  while (count < 2) {
    for (int i = 0; i < nums.length; i++) {
      while (stack.isNotEmpty && nums[stack.last] < nums[i]) {
        int index = stack.removeLast();
        ans[index] = nums[i];
      }
      stack.add(i);
    }
    count++;
  }

  return ans;
}

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

    // print(removeKdigits("112", 1));
    // print(removeKdigits("1432219", 3));
    // print(removeKdigits("10200", 1));
    // print(removeKdigits("10", 2));

    // print(nextGreaterElement([4, 1, 2], [1, 3, 4, 2]));
    // print(nextGreaterElement([2, 4], [1, 2, 3, 4]));

    // print(nextGreaterElements([1, 2, 1]));
    // print(nextGreaterElements([1, 2, 3, 4, 3]));
  }
}
