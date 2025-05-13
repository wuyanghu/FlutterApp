import 'dart:math';

import 'package:alg_demo/link_util.dart';

/*
* 精髓：
* 1个变量表示局部解，一个变量表示最大的解
* */

// 55. 跳跃游戏
bool canJump(List<int> nums) {
  int maxDistance = -1;
  int curIndex = nums[0];
  for (int i = 0; i < nums.length; i++) {
    maxDistance = max(maxDistance, i + nums[i]);
    if (i == curIndex) {
      curIndex = maxDistance;
    }
  }
  return curIndex >= nums.length - 1;
}

// 45. 跳跃游戏 II
int jump(List<int> nums) {
  int maxDitance = -1;
  int curIndex = nums[0];
  int jump = 0;

  for (int i = 0; i < nums.length; i++) {
    maxDitance = max(maxDitance, i + nums[i]);
    if (i == curIndex) {
      jump++;
      curIndex = maxDitance;
    }
  }
  return jump;
}

int maxSubArray(List<int> nums) {
  int sum = -10001;
  int subSum = 0;

  for (int i = 0; i < nums.length; i++) {
    subSum += nums[i];
    sum = max(sum, subSum);

    if (subSum < 0) {
      subSum = 0;
    }
  }
  return sum;
}

// 122. 买卖股票的最佳时机 II
int maxProfit(List<int> prices) {
  int profit = 0;
  for (int i = 1; i < prices.length; i++) {
    profit += max(0, prices[i] - prices[i - 1]);
  }
  return profit;
}

//376. 摆动序列
int wiggleMaxLength(List<int> nums) {
  if (nums.length <= 1) return nums.length;
  int down = 1, up = 1;
  for (int i = 1; i < nums.length; i++) {
    if (nums[i] > nums[i - 1]) {
      down = up + 1;
    } else if (nums[i] < nums[i - 1]) {
      up = down + 1;
    }
  }
  return max(down, up);
}

// 135. 分发糖果
int candy(List<int> ratings) {
  List<int> candy = List.filled(ratings.length, 1);

  for (int i = 1; i < ratings.length; i++) {
    if (ratings[i - 1] < ratings[i]) {
      candy[i] = candy[i - 1] + 1;
    }
  }

  for (int i = ratings.length - 2; i >= 0; i--) {
    if (ratings[i] > ratings[i + 1]) {
      candy[i] = max(candy[i], candy[i + 1] + 1);
    }
  }

  int sum = 0;
  for (int i = 0; i < candy.length; i++) {
    sum += candy[i];
  }
  return sum;
}

// 455. 分发饼干
int findContentChildren(List<int> g, List<int> s) {
  g.sort();
  s.sort();

  int i = 0, j = 0;
  while (i < g.length && j < s.length) {
    if (s[j] >= g[i]) {
      i++;
      j++;
    } else {
      j++;
    }
  }
  return i;
}

int largestRectangleArea(List<int> heights) {
  int n = heights.length;
  List<int> stack = [];
  int maxArea = 0;

  for (int i = 0; i <= n; i++) {
    int currentHeight = (i == n) ? 0 : heights[i];

    while (stack.isNotEmpty && currentHeight < heights[stack.last]) {
      int top = stack.removeLast();
      int height = heights[top];
      int width = stack.isEmpty ? i : i - stack.last - 1;
      maxArea = maxArea > (height * width) ? maxArea : (height * width);
    }

    stack.add(i);
  }

  return maxArea;
}

class GreedLeetcode implements ModulesMain {
  @override
  void main() {
    // print(largestRectangleArea([2,1,5,6,2,3]));
    // print(largestRectangleArea([2,4]));

    // print(canJump([2, 3, 1, 1, 4]));
    // print(canJump([3, 2, 1, 0, 4]));

    // print(jump([2, 3, 1, 1, 4]));
    // print(jump([2, 3, 1, 0, 4]));

    // print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]));
    // print(maxSubArray([1]));
    // print(maxSubArray([5,4,-1,7,8]));

    // print(maxProfit([7, 1, 5, 3, 6, 4]));
    // print(maxProfit([1, 2, 3, 4, 5]));
    // print(maxProfit([7, 6, 4, 3, 1]));

    // print(wiggleMaxLength([1, 7, 4, 9, 2, 5]));
    // print(wiggleMaxLength([1, 17, 5, 10, 13, 15, 10, 5, 16, 8]));
    // print(wiggleMaxLength([1, 2, 3, 4, 5, 6, 7, 8, 9]));

    // print(candy([1, 0, 2]));
    // print(candy([1, 2, 2]));

    // print(findContentChildren([1, 2, 3], [1, 1]));
    // print(findContentChildren([1, 2], [1, 2, 3]));
  }
}
