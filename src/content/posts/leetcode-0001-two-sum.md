---
type: TechDoc
title: Two Sum
description: "Dynamic Programming: LeetCode"
tags: ['tech', 'dsa', 'leetcode', 'c', 'zig', 'rust', 'go']
publishedAt: 10-27-2024
updatedAt: 11-06-2024
url: leetcode-0001-two-sum
---
## Summary
### Iterative Brute Force
Beginning with the first element in the series, check each element against the remainder of
elements until all combinations have been evaluated.
Return each index of the successful pair or empty if a pair is not found.

#### Steps
- loop through each element of the series `nums` from index `0` to index `nums_length - 1`
- within the first loop, loop again through each element of the series `nums` this time
starting from index `1` until `nums_length - 1`
- compare for equality the inner loop value of `nums[n]` with the difference of the outer loop
`nums[n]` subtracted from `target`
- if these values are equivalent, return the two indexes of each respective loop
- if both loops complete without a successful comparison, return empty

##### Complexity Analysis
**Time:** O(n^2)
**Space:** O(1)

## Implementation
**C (Iterative Brute Force)**
```c
int* two_sum(int* nums, int nums_size, int target, int* return_size);

int* two_sum(int* nums, int nums_size, int target, int* return_size) {
    *return_size = 2;

    int* solution = malloc(*return_size * sizeof(int));
    if (solution == NULL) {
        *return_size = 0;
        return NULL;
    }

    for (int i = 0; i < nums_size; i++) {
        for (int j = i + 1; j < nums_size; j++) {
            if (nums[i] == target - nums[j]) {
                solution[0] = i;
                solution[1] = j;
                return solution;
            }
        }
    }

    free(solution);
    *return_size = 0;
    return NULL;
}

int main(void) {
    int nums[] = { 3, 8, 2, -12, 24 };
    int nums_size = sizeof(nums) / sizeof(nums[0]);
    int target = 12;
    int return_size;

    int* solution = two_sum(nums, nums_size, target, &return_size);

    if (solution != NULL) {
        printf("[%d %d]\n", solution[0], solution[1]);
        free(solution);
    } else {
        printf("no matching combination\n");
    }

    return 0;
}
```

<br />

**Python (Iterative Brute Force)**
```python
from typing import List

def main():
    nums = [3, 8, 2, -12, 24]
    target = 12
    solution = Solution().twoSum(nums, target)
    print(solution)

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[i] == target - nums[j]:
                    return [i,j]
        return []
```

<!--

<br />

**zig (Iterative Brute Force)**
```zig
pub fn main() !void {
    var nums = [_]i8{ 3, 8, 2, -12, 24 };
    const nums_size: usize = nums.len;
    var target: i8 = 12;
    const return_size: usize = 2;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        _ = gpa.deinit();
    }
    var solution = try allocator.alloc(i8, return_size);
    defer allocator.free(solution);

    _ = try two_sum(&nums, nums_size, &target, &solution);
    std.debug.print("[{d} {d}]\n", .{ solution[0], solution[1] });
}

pub fn two_sum(nums: []i8, nums_size: usize, target: *i8, solution: *[]i8) !void {
    for (0..nums_size) |i| {
        for (i + 1..nums_size) |j| {
            if (nums[i] == target.* - nums[j]) {
                solution.*[0] = @intCast(i);
                solution.*[1] = @intCast(j);
                return;
            }
        }
    }
    solution.*[0] = 0;
    solution.*[1] = 0;
    return;
}
```

<br />

**go (Iterative Brute Force)**
```go
func main() {
        nums := []int{3, 8, 2, -12, 24}
        target := 12
        solution := twoSum(nums, target)
        fmt.Println(solution)
}

func twoSum(nums []int, target int) []int {
        for i := 0; i < len(nums); i++ {
                for j := i + 1; j < len(nums); j++ {
                        if nums[i] == target-nums[j] {
                                return []int{i, j}
                        }
                }
        }
        return []int{}
}
```
-->
