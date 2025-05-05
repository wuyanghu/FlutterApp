import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

int removeElement(List<int> nums, int val) {
  int r = nums.length - 1;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == val) {
      while (r > i && nums[r] == val) {
        r--;
      }

      int temp = nums[i];
      nums[i] = nums[r];
      nums[r] = temp;
    }
    if (i == r) {
      return i;
    }
  }
  return 0;
}

List<int> maxSlidingWindow(List<int> nums, int k) {
  List<int> ans = List.filled(nums.length - k + 1, 0);
  Queue<int> queue = Queue();

  for (int i = 0; i < nums.length; i++) {
    while (queue.isNotEmpty && nums[queue.last] < nums[i]) {
      queue.removeLast();
    }
    queue.add(i);

    if (queue.isNotEmpty && queue.first <= i - k - 1) {
      queue.removeFirst();
    }

    if (i + 1 >= k) {
      ans[i + 1 - k] = nums[queue.first];
    }
  }
  return ans;
}

int minSubArrayLen(int target, List<int> nums) {
  int l = 0;
  int r = 0;

  int sum = 0;
  int minLen = 100000;
  while (r < nums.length) {
    sum += nums[r];
    while (l <= r && sum >= target) {
      minLen = min(minLen, r - l + 1);
      sum -= nums[l];
      l++;
    }
    r++;
  }
  return minLen == 100000 ? 0 : minLen;
}

int lengthOfLongestSubstring(String s) {
  int start = 0;

  int maxLength = 0;
  Map<String, int> map = {};
  for (int end = 0; end < s.length; end++) {
    final cur = s[end];
    if (map.containsKey(cur) && map[cur]! > start) {
      start = map[cur]! + 1;
    }

    map[cur] = end;
    maxLength = max(maxLength, end - start + 1);
  }
  return maxLength;
}

List<List<int>> threeSum(List<int> nums) {
  List<List<int>> results = [];
  nums.sort();
  for (int i = 0; i < nums.length; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue;

    int l = i + 1;
    int r = nums.length - 1;

    while (l < r) {
      int sum = nums[i] + nums[l] + nums[r];
      if (sum == 0) {
        results.add([nums[i], nums[l], nums[r]]);

        while (l < r && nums[l] == nums[l + 1]) l++;
        while (l < r && nums[r - 1] == nums[r]) r--;

        l++;
        r--;
      } else if (sum < 0) {
        l++;
      } else {
        r--;
      }
    }
  }
  return results;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // letterCombinations("23");
    // print(permute([1,2,3]));
    // permuteUnique([1,1,2]);
    // subsets([1,2,3]);
    // print(subsetsWithDup([1,2,2]));
    // print(generateParenthesis(3));
    // print(combinationSum([2, 3, 6, 7], 7));
    // print(combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
    // print(lengthOfLongestSubstring("abcabcbb"));
    // print(lengthOfLongestSubstring("bbbbb"));
    // print(lengthOfLongestSubstring("pwwkew"));

    // print(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]));
    // print(minSubArrayLen(4, [1, 4, 4]));
    // print(minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]));

    print(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
    print(maxSlidingWindow([1], 1));
    print(maxSlidingWindow([1, -1], 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

int maxArea(List<int> height) {
  int i = 0;
  int j = height.length - 1;
  int maxArea = 0;
  while (i < j) {
    maxArea = max(min(height[i], height[j]) * (j - i), maxArea);
    if (height[i] >= height[j]) {
      i++;
    } else {
      j--;
    }
  }
  return maxArea;
}

int maxArea_11(List<int> height) {
  int i = 0;
  int j = height.length - 1;

  int maxValue = 0;

  while (i < j) {
    maxValue = max((j - i) * min(height[i], height[j]), maxValue);

    if (height[i] < height[j]) {
      j--;
    } else {
      i++;
    }
  }

  return maxValue;
}

List<int> dailyTemperatures_739(List<int> temperatures) {
  print("dailyTemperatures_739");

  List<int> ans = List.filled(temperatures.length, 0);
  List stack = [];

  for (int i = 0; i < temperatures.length; i++) {
    while (stack.isNotEmpty && temperatures[stack.last] < temperatures[i]) {
      int lastIndex = stack.removeLast();
      ans[lastIndex] = i - lastIndex;
    }

    stack.add(i);
  }

  return ans;
}

List<int> nextGreaterElement_496(List<int> nums1, List<int> nums2) {
  List<int> ans = List.filled(nums1.length, 0);

  List stack = [];
  Map map = {};

  for (int i = 0; i < nums2.length; i++) {
    while (stack.isNotEmpty && nums2[stack.last] < nums2[i]) {
      int lastIndex = stack.removeLast();

      map[nums2[lastIndex]] = nums2[i];
    }

    stack.add(i);
  }

  for (int i = 0; i < nums1.length; i++) {
    ans[i] = map[nums1[i]];
  }

  return ans;
}

List<int> nextGreaterElements_503(List<int> nums) {
  List<int> ans = List.filled(nums.length, -1);

  List stack = [];

  for (int j = 0; j < 2; j++) {
    for (int i = 0; i < nums.length; i++) {
      while (stack.isNotEmpty && nums[stack.last] < nums[i]) {
        int lastIndex = stack.removeLast();
        ans[lastIndex] = nums[i];
      }

      stack.add(i);
    }
  }

  return ans;
}

List<int> maxSlidingWindow_239(List<int> nums, int k) {
  List<int> ans = List.filled(nums.length - k + 1, 0);
  Queue queue = Queue();

  int j = 0;

  for (int i = 0; i < nums.length; i++) {
    //左边滑动，去掉过期的
    while (queue.isNotEmpty && queue.first <= i - k) {
      queue.removeFirst();
    }

    //单调栈，补充右侧
    while (queue.isNotEmpty && nums[queue.last] < nums[i]) {
      queue.removeLast();
    }
    queue.addLast(i);

    //
    if (i >= k - 1) {
      ans[j++] = nums[queue.first];
    }
  }

  return ans;
}

List<String> letterCombinations(String digits) {
  // 定义数字到字母的映射
  Map<String, String> digitToLetters = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz',
  };

  // 结果列表
  List<String> result = [];

  // 如果输入为空，直接返回空列表
  if (digits.isEmpty) {
    return result;
  }

  // 回溯函数
  void backtrack(int index, String currentCombination) {
    // 如果当前组合的长度等于输入数字的长度，将其加入结果列表
    if (currentCombination.length == digits.length) {
      result.add(currentCombination);
      return;
    }

    // 获取当前数字对应的字母
    String currentDigit = digits[index];
    String letters = digitToLetters[currentDigit]!;

    // 遍历当前数字对应的所有字母
    for (int i = 0; i < letters.length; i++) {
      // 递归调用，继续构建组合
      backtrack(index + 1, currentCombination + letters[i]);
    }
  }

  // 从第一个数字开始回溯
  backtrack(0, '');

  return result;
}

List<String> letterCombinations2(String digits) {
  List<String> results = [];
// 定义数字到字母的映射
  Map<String, String> digitToLetters = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz',
  };

  void backTrack(int index, String curStr) {
    if (curStr.length == digits.length) {
      results.add(curStr);
      return;
    }

    String curDigit = digits[index];
    String letters = digitToLetters[curDigit]!;

    for (int i = 0; i < letters.length; i++) {
      backTrack(index + 1, curStr + letters[i]);
    }
  }

  backTrack(0, "");

  return results;
}

List<List<int>> permute(List<int> nums) {
  List<List<int>> res = [];

  List<bool> used = List.filled(nums.length, false);
  List<int> path = [];

  void backtrack() {
    if (path.length == nums.length) {
      res.add(List.from(path));
      return;
    }

    for (int i = 0; i < nums.length; i++) {
      if (used[i]) continue;

      used[i] = true;
      path.add(nums[i]);

      backtrack();

      path.removeLast();
      used[i] = false;
    }
  }

  backtrack();

  return res;
}

List<List<int>> permuteUnique(List<int> nums) {
  nums.sort();

  List<List<int>> res = [];

  List<bool> used = List.filled(nums.length, false);
  List<int> path = [];

  void backtrack() {
    if (path.length == nums.length) {
      res.add(List.from(path));
      return;
    }

    for (int i = 0; i < nums.length; i++) {
      if (i > 0 && nums[i - 1] == nums[i] && used[i - 1]) continue;

      if (used[i]) continue;

      used[i] = true;
      path.add(nums[i]);

      backtrack();

      path.removeLast();
      used[i] = false;
    }
  }

  backtrack();

  return res;
}

List<List<int>> subsets(List<int> nums) {
  List<List<int>> res = [];

  List<bool> used = List.filled(nums.length, false);
  List<int> path = [];

  void backtrack(int start) {
    res.add(List.from(path));

    for (int i = start; i < nums.length; i++) {
      if (used[i]) continue;

      used[i] = true;
      path.add(nums[i]);

      backtrack(i + 1);

      path.removeLast();
      used[i] = false;
    }
  }

  backtrack(0);

  return res;
}

List<List<int>> subsetsWithDup(List<int> nums) {
  nums.sort();

  List<List<int>> res = [];

  List<bool> used = List.filled(nums.length, false);
  List<int> path = [];

  void backtrack(int start) {
    res.add(List.from(path));

    for (int i = start; i < nums.length; i++) {
      if (i > 0 && nums[i - 1] == nums[i] && !used[i - 1]) continue;

      if (used[i]) continue;

      used[i] = true;
      path.add(nums[i]);

      backtrack(i + 1);

      path.removeLast();
      used[i] = false;
    }
  }

  backtrack(0);

  return res;
}

List<String> generateParenthesis(int n) {
  List<String> results = [];

  void backtrack(int left, int right, String curStr) {
    if (curStr.length == 2 * n) {
      results.add(curStr);
      return;
    }

    if (left < n) {
      backtrack(left + 1, right, curStr + "(");
    }
    if (right < left) {
      backtrack(left, right + 1, curStr + ")");
    }
  }

  backtrack(0, 0, "");

  return results;
}

List<List<int>> combinationSum(List<int> candidates, int target) {
  List<List<int>> results = [];
  List<int> path = [];

  void backtrack(int index, curTarget) {
    if (curTarget == 0) {
      results.add(List.from(path));
      return;
    }

    for (int i = index; i < candidates.length; i++) {
      if (curTarget > 0) {
        path.add(candidates[i]);
        backtrack(i, curTarget - candidates[i]);
        path.removeLast();
      }
    }
  }

  backtrack(0, target);

  return results;
}

List<List<int>> combinationSum2(List<int> candidates, int target) {
  List<List<int>> results = [];
  List<int> path = [];

  candidates.sort();

  void backtrack(int index, curTarget) {
    if (curTarget == 0) {
      results.add(List.from(path));
      return;
    }

    for (int i = index; i < candidates.length; i++) {
      if (i > index && candidates[i] == candidates[i - 1]) {
        continue;
      }

      if (curTarget > 0) {
        path.add(candidates[i]);
        backtrack(i + 1, curTarget - candidates[i]);
        path.removeLast();
      }
    }
  }

  backtrack(0, target);

  return results;
}
