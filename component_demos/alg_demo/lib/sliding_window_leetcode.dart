import 'dart:collection';
import 'dart:math';

import 'package:alg_demo/link_util.dart';
import 'package:flutter/material.dart';

//1004. 最大连续1的个数 III
int longestOnes(List<int> nums, int k) {
  int l = 0;
  int r = 0;
  int zeroCount = 0;
  int maxLen = 0;

  while (r < nums.length) {
    if (nums[r] == 0) {
      zeroCount++;
    }

    while (zeroCount > k) {
      if (nums[l] == 0) {
        zeroCount--;
      }
      l++;
    }

    maxLen = max(r - l + 1, maxLen);
    r++;
  }
  return maxLen;
}

///239. 滑动窗口最大值
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

    if (i >= k - 1) {
      ans[j++] = nums[queue.first];
    }
  }

  return ans;
}

//3. 无重复字符的最长子串
int lengthOfLongestSubstring(String s) {
  int start = 0;

  int maxLength = 0;
  Map<String, int> map = {};
  for (int end = 0; end < s.length; end++) {
    final cur = s[end];
    if (map.containsKey(cur) && map[cur]! >= start) {
      start = map[cur]! + 1;
    }

    map[cur] = end;
    maxLength = max(maxLength, end - start + 1);
  }
  return maxLength;
}

//76. 最小覆盖子串 未验证
String minWindow(String s, String t) {
  Map<String, int> need = {};
  Map<String, int> window = {};

  for (int i = 0; i < t.length; i++) {
    need[t[i]] = (need[t[i]] ?? 0) + 1;
  }

  int left = 0, right = 0;
  int valid = 0;
  int start = 0, len = s.length + 1;

  while (right < s.length) {
    String c = s[right];
    right++;

    if (need.containsKey(c)) {
      window[c] = (window[c] ?? 0) + 1;
      if (window[c] == need[c]) {
        valid++;
      }
    }

    while (valid == need.length) {
      if (right - left < len) {
        start = left;
        len = right - left;
      }

      String d = s[left];
      left++;

      if (need.containsKey(d)) {
        if (window[d] == need[d]) {
          valid--;
        }
        window[d] = (window[d] ?? 0) - 1;
      }
    }
  }

  return len == s.length + 1 ? "" : s.substring(start, start + len);
}

//438. 找到字符串中所有字母异位词
List<int> findAnagrams(String s, String p) {
  if (s.length < p.length) return [];

  bool _isEqual(List<int> pCount, List<int> sCount) {
    for (int i = 0; i < 26; i++) {
      if (pCount[i] != sCount[i]) return false;
    }
    return true;
  }

  List<int> ans = [];

  List<int> sCount = List.filled(26, 0);
  List<int> pCount = List.filled(26, 0);

  int aCode = "a".codeUnitAt(0);

  for (int i = 0; i < p.length; i++) {
    sCount[s.codeUnitAt(i) - aCode]++;
    pCount[p.codeUnitAt(i) - aCode]++;
  }

  if (_isEqual(sCount, pCount)) ans.add(0);

  for (int i = p.length; i < s.length; i++) {
    sCount[s.codeUnitAt(i) - aCode]++;
    sCount[s.codeUnitAt(i - p.length) - aCode]--;
    if (_isEqual(pCount, sCount)) ans.add(i - p.length + 1);
  }
  return ans;
}

//567. 字符串的排列
bool checkInclusion(String s1, String s2) {
  if (s1.length > s2.length) return false;

  bool _isEqual(List<int> s1, List<int> s2) {
    for (int i = 0; i < 26; i++) {
      if (s1[i] != s2[i]) return false;
    }
    return true;
  }

  List<int> s1Count = List.filled(26, 0);
  List<int> s2Count = List.filled(26, 0);

  int aCode = 'a'.codeUnitAt(0);

  for (int i = 0; i < s1.length; i++) {
    s1Count[s1.codeUnitAt(i) - aCode]++;
    s2Count[s2.codeUnitAt(i) - aCode]++;
  }

  if (_isEqual(s1Count, s2Count)) return true;

  for (int i = s1.length; i < s2.length; i++) {
    s2Count[s2.codeUnitAt(i) - aCode]++;
    s2Count[s2.codeUnitAt(i - s1.length) - aCode]--;

    if (_isEqual(s1Count, s2Count)) return true;
  }
  return false;
}

// 560. 和为 K 的子数组
int subarraySum(List<int> nums, int k) {
  int count = 0;
  int sum = 0;
  int l = 0;

  for (int r = 0; r < nums.length; r++) {
    sum += nums[r];

    if (sum == k) {
      count += 1;
    }
    //收缩
    while (sum > k && l < r) {
      sum -= nums[l];
      l++;
      if (sum == k) {
        count += 1;
      }
    }
  }
  return count;
}

//209. 长度最小的子数组
int minSubArrayLen(int target, List<int> nums) {
  int minLen = nums.length + 1;
  int l = 0;
  int sum = 0;
  for (int r = 0; r < nums.length; r++) {
    sum += nums[r];

    while (sum >= target) {
      minLen = min(minLen, r - l + 1);

      sum -= nums[l];
      l++;
    }
  }

  return minLen == nums.length + 1 ? 0 : minLen;
}

// 53. 最大子数组和
// int maxSubArray(List<int> nums) {
//   int maxSum = -10001;
//   int sum = 0;
//   int l = 0;
//   for (int r = 0; r < nums.length; r++) {
//     sum += nums[r];
//
//     if (sum < 0) {
//
//     }
//   }
// }

int characterReplacement(String s, int k) {
  int ACode = "A".codeUnitAt(0);
  List<int> sCount = List.filled(26, 0);

  int left = 0;
  int right = 0;
  int maxLen = 0;
  while (right < s.length) {
    sCount[s.codeUnitAt(right) - ACode]++;

    int maxCount = sCount.reduce((a, b) => a > b ? a : b);

    while (right - left + 1 - maxCount > k) {
      sCount[s.codeUnitAt(left) - ACode]--;
      left++;
    }

    maxLen = maxLen > (right - left + 1) ? maxLen : (right - left + 1);
    right++;
  }
  return maxLen;
}

class SlidingWindowLeetcode implements ModulesMain {
  @override
  void main() {
    // TODO: implement main
  }
}
