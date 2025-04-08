import 'dart:math';

class Solution {
  //数组: 移除数组元素 双指针
  int removeElement_27(List<int> nums, int val) {
    int l = 0;
    int r = nums.length - 1;

    while (l <= r) {
      // 修改为 <= 确保所有元素都被检查
      if (nums[l] == val) {
        while (r > l && nums[r] == val) {
          // 确保 r > l
          r -= 1;
        }
        nums[l] = nums[r];
        r -= 1; // 更新 r
      } else {
        l += 1;
      }
    }

    return l; // l 表示不包含 val 的数组长度
  }

  int removeElement_27_2(List<int> nums, int val) {
    //解法2，采用覆盖法，可以试试
    return 0;
  }

  int minSubArrayLen_209(int target, List<int> nums) {
    int subLen = 100001; // 初始化为一个较大的值
    int sum = 0;
    int l = 0;

    for (int r = 0; r < nums.length; r++) {
      sum += nums[r];
      while (sum >= target) {
        subLen = min(subLen, r - l + 1); // 更新最短子数组长度
        sum -= nums[l]; // 收缩窗口左边界
        l++;
      }
    }

    return subLen == 100001 ? 0 : subLen; // 如果没有找到满足条件的子数组，返回 0
  }

  //数组:二分查找 左闭右闭区间
  int search_704(List<int> nums, int target) {
    int left = 0;
    int right = nums.length - 1;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (target > nums[mid]) {
        left = mid + 1;
      } else if (target < nums[mid]) {
        right = mid - 1;
      } else {
        return mid;
      }
    }
    return -1;
  }

  //数组:
  List<int> sortedSquares_977(List<int> nums) {
    List<int> res = List.filled(nums.length, 0);

    int curPos = nums.length - 1;

    int l = 0;
    int r = nums.length - 1;
    while (l <= r) {
      if (nums[l] * nums[l] >= nums[r] * nums[r]) {
        res[curPos] = nums[l] * nums[l];
        l += 1;
      } else {
        res[curPos] = nums[r] * nums[r];
        r -= 1;
      }
      curPos -= 1;
    }
    return res;
  }

  int jump_49(List<int> nums) {
    int jumps = 0;
    int maxValue = -1;
    int currentEnd = 0; // 当前跳跃的边界

    for (int i = 0; i < nums.length; i++) {
      maxValue = max(maxValue, i + nums[i]);
      if (currentEnd == i) {
        jumps += 1;
        currentEnd = maxValue;

        if (maxValue >= nums.length - 1) {
          break;
        }
      }
    }
    return jumps;
  }

  int lengthOfLongestSubstring_3(String s) {
    int maxLen = 0;
    int l = 0;
    Map<String, int> indexMap = {};

    for (int r = 0; r < s.length; r++) {
      final cur = s[r];

      //收缩窗口
      if (indexMap.containsKey(cur)) {
        l = max(indexMap[cur]! + 1, l);
      }

      //更新右侧窗口
      indexMap[cur] = r;
      maxLen = max(maxLen, r - l + 1);
    }

    return maxLen;
  }

  bool checkInclusion(String s1, String s2) {
    if (s1.length > s2.length) return false;

    // 定义两个字符计数数组，分别表示 s1 和当前窗口的字符频率
    List<int> count1 = List.filled(26, 0);
    List<int> count2 = List.filled(26, 0);

    // 初始化 s1 的字符频率
    for (int i = 0; i < s1.length; i++) {
      count1[s1[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
      count2[s2[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
    }

    // 滑动窗口遍历 s2
    for (int i = s1.length; i < s2.length; i++) {
      if (isEqual(count1, count2)) {
        return true;
      }
      // 移动窗口：移除窗口左侧字符，加入窗口右侧字符
      count2[s2[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
      count2[s2[i - s1.length].codeUnitAt(0) - 'a'.codeUnitAt(0)]--;
    }

    // 检查最后一个窗口
    return isEqual(count1, count2);
  }

  bool isEqual(List<int> count1, List<int> count2) {
    for (int i = 0; i < 26; i++) {
      if (count1[i] != count2[i]) return false;
    }
    return true;
  }

  List<List<int>> threeSum_15(List<int> nums) {
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

  int findLengthOfLCIS_674(List<int> nums) {
    int maxSubLen = 1;
    int sublen = 1;

    for (int r = 1; r < nums.length; r++) {
      if (nums[r] > nums[r - 1]) {
        sublen += 1;
      } else {
        sublen = 1;
      }
      maxSubLen = max(maxSubLen, sublen);
    }
    return maxSubLen;
  }

  int longestConsecutive_128(List<int> nums) {
    final numSet = Set.from(nums);
    int maxLen = 0;

    for (final num in nums) {
      if (!numSet.contains(num - 1)) {
        int len = 0;
        int i = num;
        while (numSet.contains(i)) {
          len += 1;
          i += 1;
        }
        maxLen = max(maxLen, len);
      }
    }
    return maxLen;
  }

  // int findKthLargest(List<int> nums, int k) {
  //     int index = quick(nums, 0, nums.length-1);
  //     while(index != k) {
  //
  //     }
  // }

  void quick(List<int> nums, int l, int r) {
    int l1 = l, r1 = r;

    if (l >= r) {
      return;
    }

    int key = nums[l];

    while (l < r) {
      //从右边开始找到第一个比key小的数
      while (l < r && nums[r] >= key) r--;
      if (l < r) nums[l] = nums[r];

      while (l < r && nums[l] <= key) l++;
      if (l < r) nums[r] = nums[l];
    }

    nums[l] = key;

    quick(nums, l1, l - 1);
    quick(nums, l + 1, r1);
  }

  //快排
  List<int> sortArray(List<int> nums) {
    quick(nums, 0, nums.length - 1);
    return nums;
  }

  int quick2(List<int> nums, int l, int r) {
    if (l >= r) {
      return l;
    }

    int key = nums[l];

    while (l < r) {
      //从右边开始找到第一个比key小的数
      while (l < r && nums[r] >= key) r--;
      if (l < r) nums[l] = nums[r];

      while (l < r && nums[l] <= key) l++;
      if (l < r) nums[r] = nums[l];
    }

    nums[l] = key;

    return l;
  }

  int findKthLargest(List<int> nums, int k) {
    int index = nums.length - k;
    int quickIndex = quick2(nums, 0, nums.length - 1);
    while (index != quickIndex) {
      if (quickIndex < index) {
        quickIndex = quick2(nums, quickIndex + 1, nums.length - 1);
      } else if (quickIndex > index) {
        quickIndex = quick2(nums, 0, quickIndex - 1);
      }
    }
    return nums[quickIndex];
  }

  int findKthLargest2(List<int> nums, int k) {
    // 从最后一个非叶子节点开始调整成最大堆
    for (int i = (nums.length ~/ 2) - 1; i >= 0; i--) {
      heapify(nums, i, nums.length);
    }

    int k1 = k;
    // 排序：将大顶堆的根节点放到最后，调整堆大小并继续堆化
    for (int i = nums.length - 1; i > 0; i--) {
      // 交换堆顶和当前元素
      swap(nums, 0, i);
      // 调整堆，保证堆顶为最大值
      heapify(nums, 0, i);
      if (--k1 == 0) {
        break;
      }
    }
    return nums[nums.length - k];
  }

  void heapify(List<int> nums, int parentIndex, int len) {
    int childIndex = 2 * parentIndex + 1; // 左子节点索引
    int parentVal = nums[parentIndex];

    while (childIndex < len) {
      // 如果右子节点存在，并且右子节点比左子节点大，则选择右子节点
      if (childIndex + 1 < len && nums[childIndex] < nums[childIndex + 1]) {
        childIndex = childIndex + 1;
      }

      // 如果父节点大于等于最大的子节点，退出
      if (parentVal > nums[childIndex]) {
        break;
      }

      // 否则交换父节点和最大的子节点
      nums[parentIndex] = nums[childIndex];
      parentIndex = childIndex;

      // 更新子节点索引为左子节点
      childIndex = 2 * childIndex + 1;
    }

    // 将父节点最终的值放到正确的位置
    nums[parentIndex] = parentVal;
  }

  //堆排
  List<int> heapSortArray(List<int> nums) {
    // 从最后一个非叶子节点开始调整成最大堆
    for (int i = (nums.length ~/ 2) - 1; i >= 0; i--) {
      heapify(nums, i, nums.length);
    }

    // 排序：将大顶堆的根节点放到最后，调整堆大小并继续堆化
    for (int i = nums.length - 1; i > 0; i--) {
      // 交换堆顶和当前元素
      swap(nums, 0, i);
      // 调整堆，保证堆顶为最大值
      heapify(nums, 0, i);
    }

    return nums;
  }

  //合并排序
  List<int> mergeSort(List<int> nums) {
    if (nums.length <= 1) {
      return nums; // 基本情况：长度为1或0的数组已经有序
    }

    // 将数组分成两半
    int mid = nums.length ~/ 2;
    List<int> left = mergeSort(nums.sublist(0, mid)); // 左半部分
    List<int> right = mergeSort(nums.sublist(mid)); // 右半部分

    // 合并已排序的左右两部分
    return merge(left, right);
  }

  List<int> merge(List<int> left, List<int> right) {
    List<int> result = [];
    int i = 0, j = 0;

    // 比较两个子数组的元素，按顺序合并
    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) {
        result.add(left[i]);
        i++;
      } else {
        result.add(right[j]);
        j++;
      }
    }

    // 如果左边数组还有剩余元素，直接加入结果数组
    while (i < left.length) {
      result.add(left[i]);
      i++;
    }

    // 如果右边数组还有剩余元素，直接加入结果数组
    while (j < right.length) {
      result.add(right[j]);
      j++;
    }

    return result;
  }

  void swap(List<int> nums, int l, int r) {
    int temp = nums[l];
    nums[l] = nums[r];
    nums[r] = temp;
  }

  //  输入：nums = [1,2,3]
  //  输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  List<List<int>> permute(List<int> nums) {
    List<List<int>> results = [];
    //辅助变量，用于回溯
    List<int> path = [];
    List<bool> used = List.filled(nums.length, false);

    void backtrack(List<int> nums) {
      if (nums.length == path.length) {
        //满足递归条件
        results.add(List.from(path));
        return;
      }

      for (int i = 0; i < nums.length; i++) {
        //回溯,去重
        if (used[i]) continue;

        used[i] = true;
        path.add(nums[i]);

        backtrack(nums);

        path.removeLast(); //回溯
        used[i] = false;
      }
    }

    backtrack(nums);

    return results;
  }

  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort();

    List<List<int>> results = [];
    //辅助变量，用于回溯
    List<int> path = [];
    List<bool> used = List.filled(nums.length, false);

    void backtrack() {
      if (nums.length == path.length) {
        //满足递归条件
        results.add(List.from(path));
        return;
      }

      for (int i = 0; i < nums.length; i++) {
        //回溯,去重
        if (used[i] || (i > 0 && nums[i - 1] == nums[i] && !used[i - 1]))
          continue;

        used[i] = true;
        path.add(nums[i]);

        backtrack();

        path.removeLast(); //回溯
        used[i] = false;
      }
    }

    backtrack();

    return results;
  }

  //  输入：nums = [1,2,3]
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> results = [];
    //辅助变量，用于回溯
    List<int> path = [];
    List<bool> used = List.filled(nums.length, false);

    void backtrack(List<int> nums, int start) {
      results.add(List.from(path));

      for (int i = start; i < nums.length; i++) {
        path.add(nums[i]);
        used[i] = true;

        backtrack(nums, i + 1);
        path.removeLast(); //回溯
        used[i] = false;
      }
    }

    backtrack(nums, 0);

    return results;
  }

  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) {
      return [];
    }

    // 数字到字母的映射表
    Map<String, String> phoneMap = {
      "2": "abc",
      "3": "def",
      "4": "ghi",
      "5": "jkl",
      "6": "mno",
      "7": "pqrs",
      "8": "tuv",
      "9": "wxyz",
    };

    List<String> results = [];
    String path = "";

    void backtrack(int index) {
      if (index == digits.length) {
        results.add(path);
        return;
      }

      final digit = digits[index];
      final letters = phoneMap[digit] ?? "";

      for (int i = 0; i < letters.length; i++) {
        path += letters[i];
        backtrack(i);
        path = path.substring(0, path.length - 1);
      }
    }

    backtrack(0);

    return results;
  }

//[3,2,1,0,4]
  bool canJump(List<int> nums) {
    int maxDistance = 0;
    int curReal = 0;

    for (int i = 0; i < nums.length - 1; i++) {
      maxDistance = max(i + nums[i], maxDistance);
      if (i == curReal) {
        curReal = maxDistance;
      }
    }
    return curReal >= nums.length - 1;
  }

  int jump(List<int> nums) {
    int jums = 0;
    int maxDistance = 0;
    int curReal = 0;

    for (int i = 0; i < nums.length - 1; i++) {
      maxDistance = max(maxDistance, i + nums[i]);
      if (i == curReal) {
        curReal = maxDistance;
        jums++;
      }
    }
    return jums;
  }

  int maxSubArray(List<int> nums) {
    int maxSum = -100001;
    int subSum = 0;
    for (int i = 0; i < nums.length; i++) {
      subSum += nums[i];
      maxSum = max(subSum, maxSum);
      if (subSum < 0) {
        subSum = 0;
      }
    }
    return maxSum;
  }

  int maxProfit(List<int> prices) {
    int profit = 0;
    for (int i = 1; i < prices.length; i++) {
      profit += max(prices[i] - prices[i - 1], 0);
    }
    return profit;
  }

  //[29,51,87,87,72,121
  // 1 2 3 3 1 2
  int candy(List<int> ratings) {
    List<int> candies = List.filled(ratings.length, 1);

    //从左到右，确保右边的评分高的糖果比左边多
    for (int i = 1; i < ratings.length; i++) {
      if (ratings[i] > ratings[i - 1]) {
        candies[i] = candies[i - 1] + 1;
      }
    }

    //从右往左，确保左边的评分高的糖果比右边多
    for (int i = ratings.length - 2; i >= 0; i--) {
      if (ratings[i] > ratings[i + 1]) {
        candies[i] = max(candies[i + 1] + 1, candies[i]);
      }
    }

    int sum = 0;

    for (int candie in candies) {
      sum += candie;
    }
    return sum;
  }

  int wiggleMaxLength(List<int> nums) {
    if (nums.length == 1) return 1;
    int up = 1, down = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        up = down + 1;
      } else if (nums[i] < nums[i - 1]) {
        down = up + 1;
      }
    }
    return max(up, down);
  }

  int findContentChildren(List<int> g, List<int> s) {
      s.sort();
      g.sort();

      int i = 0,j = 0;
      while(i<g.length && j<s.length) {
        if (s[j] >= g[i]) {
          i ++;
          j ++;

        } else {
          j++;
        }
      }
      return i;
  }

  int trap(List<int> height) {
      List<int> leftMax = List.filled(height.length, 0);
      List<int> rightMax = List.filled(height.length, 0);

      //记录当前最大的值
      leftMax[0] = height[0];
      for(int i = 1;i<height.length;i++) {
        leftMax[i] = max(leftMax[i-1], height[i]);
      }

      rightMax[height.length-1] = height[height.length-1];
      for (int i = height.length-2;i>=0;i--){
        rightMax[i] = max(rightMax[i+1], height[i]);
      }

      int ans = 0;
      for (int i = 0;i<height.length;i++) {
        ans += max(min(leftMax[i], rightMax[i])-height[i], 0) ;
      }
      return ans;
  }

  String removeKdigits(String num, int k) {
    List<String> stack = [];

    for (int i = 0;i<num.length;i++) {
      while(k > 0 && stack.isNotEmpty && stack.last.compareTo(num[i]) > 0) {
        stack.removeLast();
        k -- ;
      }
      stack.add(num[i]);
    }

    while(k > 0) {
      stack.removeLast();
      k -- ;
    }
    // 将栈中的数字转换成字符串
    String result = stack.join();
    // 去掉前导零
    result = result.replaceFirst(RegExp(r'^0+'), '');
    // 如果结果为空，返回 "0"
    return result.isEmpty ? "0" : result;
  }
}
