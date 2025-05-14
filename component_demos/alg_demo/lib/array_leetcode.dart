import 'dart:math';

import 'package:alg_demo/link_util.dart';

//1. 两数之和
List<int> twoSum(List<int> nums, int target) {
  //key: nums[i] value: i
  Map<int, int> map = {};

  for (int i = 0; i < nums.length; i++) {
    if (map[target - nums[i]] != null) {
      return [map[target - nums[i]]!, i];
    }
    map[nums[i]] = i;
  }
  return [];
}

// 560. 和为 K 的子数组
int subarraySum(List<int> nums, int k) {
  //key: presum value:次数
  Map<int, int> map = {0: 1};

  int sum = 0;
  int count = 0;
  for (int i = 0; i < nums.length; i++) {
    sum += nums[i];

    if (map[sum - k] != null) {
      count += map[sum - k]!;
    }

    map[sum] = (map[sum] ?? 0) + 1;
  }
  return count;
}


class ArrayLeetCode implements ModulesMain {
  @override
  void main() {
    // print(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]));
    // print(minSubArrayLen(4, [1, 4, 4]));
    // print(minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]));

    // print(twoSum([2,7,11,15],9));
    // print(twoSum([3,2,4],6));
    // print(twoSum([3,3],6));

    // print(subarraySum([1, 1, 1], 2));
    // print(subarraySum([1, 2, 3], 3));
  }
}
