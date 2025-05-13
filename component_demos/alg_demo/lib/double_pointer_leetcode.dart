import 'dart:math';

import 'link_util.dart';

// 11. 盛最多水的容器
int maxArea(List<int> height) {
  int left = 0;
  int right = height.length - 1;

  int maxArea = 0;
  while (left < right) {
    maxArea = max(maxArea, (right - left) * min(height[left], height[right]));

    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return maxArea;
}

// 42. 接雨水
int trap(List<int> height) {
  int leftMax = 0;
  int rightMax = 0;
  int sum = 0;

  int left = 0;
  int right = height.length - 1;
  while (left < right) {
    if (height[left] < height[right]) {
      if (leftMax < height[left]) {
        leftMax = height[left];
      } else {
        sum += leftMax - height[left];
      }
      left++;
    } else {
      if (rightMax < height[right]) {
        rightMax = height[right];
      } else {
        sum += rightMax - height[right];
      }
      right--;
    }
  }
  return sum;
}

// 15. 三数之和
//[-4,-1,-1,-1,0,1,2]
List<List<int>> threeSum(List<int> nums) {
  List<List<int>> ans = [];
  nums.sort();
  for (int i = 0; i < nums.length; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue;

    int j = i + 1;
    int k = nums.length - 1;
    while (j < k) {
      int sum = nums[i] + nums[j] + nums[k];
      if (sum == 0) {
        ans.add([nums[i], nums[j], nums[k]]);

        while (j < k && nums[j] == nums[j + 1]) {
          j++;
        }
        while (k > j && nums[k - 1] == nums[k]) {
          k--;
        }

        j++;
        k--;
      } else if (sum < 0) {
        j++;
      } else {
        k--;
      }
    }
  }
  return ans;
}

//27. 移除元素
int removeElement(List<int> nums, int val) {
  int l = 0;
  int r = nums.length - 1;
  while (l <= r) {
    if (nums[l] == val) {
      while (r > l && nums[r] == val) {
        r--;
      }

      nums[l] = nums[r];
      r--;
    } else {
      l++;
    }
  }
  return l;
}


class DoublePointerLeetcode implements ModulesMain{
  @override
  void main() {
    // print(threeSum([-1,0,1,2,-1,-4]));

    // print(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]));
    // print(trap([4, 2, 0, 3, 2, 5]));

    // print(removeElement([3, 2, 2, 3], 3));
    // print(removeElement([0, 1, 2, 2, 3, 0, 4, 2], 2));
    // print(removeElement([2], 3));
    // print(removeElement([1], 1));
  }
}

