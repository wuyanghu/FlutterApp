import 'package:alg_demo/link_util.dart';

// 22. 括号生成
List<String> generateParenthesis(int n) {
  List<String> ans = [];
  void dfs(String str, int l, int r) {
    if (str.length == 2 * n) {
      ans.add(str);
      return;
    }

    if (l < n) {
      dfs(str + "(", l + 1, r);
    }
    if (r < l) {
      dfs(str + ")", l, r + 1);
    }
  }

  dfs('', 0, 0);
  return ans;
}

// List<String> letterCombinations(String digits) {
//
// }

//46.全排列
List<List<int>> permute(List<int> nums) {
  List<List<int>> ans = [];
  List<bool> used = List.filled(nums.length, false);

  void dfs(List<int> subans) {
    if (subans.length == nums.length) {
      ans.add(List.from(subans));
      return;
    }
    for (int i = 0; i < nums.length; i++) {
      if (used[i]) continue;
      subans.add(nums[i]);
      used[i] = true;
      dfs(subans);
      used[i] = false;
      subans.removeLast();
    }
  }

  dfs([]);
  return ans;
}

// 47. 全排列 II
List<List<int>> permuteUnique(List<int> nums) {
  nums.sort();

  List<List<int>> ans = [];
  List<int> subans = [];
  List<bool> used = List.filled(nums.length, false);
  void dfs(int index) {
    if (subans.length == nums.length) {
      ans.add(List.from(subans));
      return;
    }
    for (int i = 0; i < nums.length; i++) {
      if (i > 0 && nums[i] == nums[i - 1] && used[i - 1]) continue;
      if (used[i]) continue;
      used[i] = true;
      subans.add(nums[i]);

      dfs(i + 1);

      subans.removeLast();
      used[i] = false;
    }
  }

  dfs(
    0,
  );
  return ans;
}

// 77. 组合
List<List<int>> combine(int n, int k) {
  List<int> nums = List.generate(n, (i) => i + 1);

  List<List<int>> ans = [];
  List<bool> used = List.filled(n, false);
  List<int> subans = [];
  void dfs(int index) {
    if (subans.length == k) {
      ans.add(List.from(subans));
      return;
    }

    for (int i = index; i < nums.length; i++) {
      if (used[i]) continue;
      used[i] = true;
      subans.add(nums[i]);
      dfs(i + 1);
      subans.removeLast();
      used[i] = false;
    }
  }

  dfs(0);
  return ans;
}

//78.子集
List<List<int>> subsets(List<int> nums) {
  List<bool> used = List.filled(nums.length, false);
  List<List<int>> ans = [];
  List<int> subans = [];

  void dfs(int index) {
    ans.add(List.from(subans));

    for (int i = index; i < nums.length; i++) {
      if (used[i]) continue;

      subans.add(nums[i]);
      used[i] = true;

      dfs(i + 1);

      used[i] = false;
      subans.removeLast();
    }
  }

  dfs(0);
  return ans;
}

// 90. 子集 II
List<List<int>> subsetsWithDup(List<int> nums) {
  List<bool> used = List.filled(nums.length, false);
  List<List<int>> ans = [];
  List<int> subans = [];

  void dfs(int index) {
    ans.add(List.from(subans));

    for (int i = index; i < nums.length; i++) {
      if (i > index && nums[i] == nums[i - 1] && !used[i - 1]) continue;

      if (used[i]) continue;

      subans.add(nums[i]);
      used[i] = true;

      dfs(i + 1);

      used[i] = false;
      subans.removeLast();
    }
  }

  dfs(0);
  return ans;
}

// 17. 电话号码的字母组合
List<String> letterCombinations(String digits) {
  final map = {
    "2": "abc",
    "3": "def",
    "4": "ghi",
    "5": "jkl",
    "6": "mno",
    "7": "pqrs",
    "8": "tuv",
    "9": "wxyz"
  };

  List<String> ans = [];
  void dfs(String cur, int index) {
    if (digits.isEmpty) return;
    if (cur.length == digits.length) {
      ans.add(cur);
      return;
    }

    if (index < digits.length) {
      final str = map[digits[index]]!;
      for (int j = 0; j < str.length; j++) {
        dfs(cur + str[j], index + 1);
      }
    }
  }

  dfs("", 0);
  return ans;
}

// 39. 组合总和
List<List<int>> combinationSum(List<int> candidates, int target) {
  List<List<int>> ans = [];
  List<int> subans = [];

  candidates.sort();
  void dfs(int sum, int index) {
    if (target == sum) {
      ans.add(List.from(subans));
      return;
    }
    if (sum > target) {
      return;
    }
    for (int i = index; i < candidates.length; i++) {
      subans.add(candidates[i]);
      sum += candidates[i];
      dfs(sum, i);
      sum -= candidates[i];
      subans.removeLast();
    }
  }

  dfs(0, 0);
  return ans;
}

// 40. 组合总和 II
List<List<int>> combinationSum2(List<int> candidates, int target) {
  List<List<int>> ans = [];
  List<int> subans = [];
  List<bool> used = List.filled(candidates.length, false);

  candidates.sort();
  void dfs(int sum, int index) {
    if (target == sum) {
      ans.add(List.from(subans));
      return;
    }
    if (sum > target) {
      return;
    }
    for (int i = index; i < candidates.length; i++) {
      if (i > index && candidates[i - 1] == candidates[i] && !used[i - 1]) {
        continue;
      }
      if (used[i]) continue;
      used[i] = true;
      subans.add(candidates[i]);
      sum += candidates[i];
      dfs(sum, i);
      sum -= candidates[i];
      used[i] = false;
      subans.removeLast();
    }
  }

  dfs(0, 0);
  return ans;
}

class DfsLeetcode implements ModulesMain {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> ans = [];
    List<bool> used = List.filled(nums.length, false);
    void dfs(List<int> subans, int index) {
      ans.add(List.from(subans));
      for (int i = index; i < nums.length; i++) {
        if (used[i]) continue;
        subans.add(nums[i]);
        used[i] = true;
        dfs(subans, i + 1);
        used[i] = false;
        subans.removeLast();
      }
    }

    dfs([], 0);
    return ans;
  }

  @override
  void main() {
    // print(generateParenthesis(1));
    // print(generateParenthesis(2));
    // print(generateParenthesis(3));

    // print(permute([1, 2, 3]));
    // print(permute([0, 1]));

    // print(permuteUnique([1, 1, 2]));

    // print(combine(4, 2));
    // print(combine(1, 1));

    print(subsets([1, 2, 3]));
    // print(subsetsWithDup([1, 2, 2]));

    // print(letterCombinations("23"));
    // print(letterCombinations(""));
    // print(letterCombinations("2"));

    // print(combinationSum([2, 3, 6, 7], 7));
    // print(combinationSum([2, 3, 5], 8));

    // print(combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
    // print(combinationSum2([2, 5, 2, 1, 2], 5));
  }
}
