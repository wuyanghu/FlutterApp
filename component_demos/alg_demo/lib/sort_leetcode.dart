import 'package:alg_demo/link_util.dart';

List<int> sortArray(List<int> nums) {
  quickSort(nums, 0, nums.length - 1);
  return nums;
}

void quickSort(List<int> nums, int start, int end) {
  if (nums.isEmpty || start >= end) return;
  int l = start;
  int r = end;

  int pivot = nums[start];

  while (start < end) {
    while (start < end && nums[end] >= pivot) {
      end--;
    }

    if (start < end) {
      nums[start] = nums[end];
    }

    while (start < end && nums[start] <= pivot) {
      start++;
    }

    if (start < end) {
      nums[end] = nums[start];
    }
  }
  nums[start] = pivot;
  quickSort(nums, l, start - 1);
  quickSort(nums, start + 1, r);
}

class SortLeetcode implements ModulesMain {
  @override
  void main() {
    // print(sortArray([5, 2, 3, 1]));
    // print(sortArray([5, 1, 1, 2, 0, 0]));
  }
}
