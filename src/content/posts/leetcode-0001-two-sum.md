---
type: TechDoc
title: Two Sum
description: "Dynamic Programming: LeetCode"
tags: ['tech', 'dsa', 'leetcode', 'go']
publishedAt: 10-27-2024
updatedAt: 10-27-2024
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
- if both loops complete without a successful comparison, return a non-result

##### Complexity Analysis
**Time:** O(n^2)  
**Space:** O(1)

## Implementation
`c (Iterative Brute Force)`
```c
int* two_sum(int* nums, int nums_size, int target, int* return_size);

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

int* two_sum(int* nums, int nums_size, int target, int* return_size) {
    *return_size = 2;

    int* solution = malloc(*return_size * sizeof(int));
    if (solution == NULL) {
        *return_size = 0;
        return NULL;
    }

    for (int i = 0; i < nums_size; i++) {
        for (int j = i + 1; j < nums_size; j++) {
            if (nums[i] + nums[j] == target) {
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
```

<br />

`zig (Iterative Brute Force)`
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

`c++ (Iterative Brute Force)`
```cpp
class Solution {
    public:
        std::vector<int> twoSum(std::vector<int>& nums, int target) {
            for (size_t i = 0; i < nums.size(); i++) {
                for (size_t j = i + 1; j < nums.size(); j++) {
                    if (nums[i] == target - nums[j]) {
                        return { static_cast<int>(i), static_cast<int>(j) };
                    }
                }
            }

            return {0, 0};
        }
};

int main() {
    std::vector<int> nums = { 3, 8, 2, -12, 24};
    int target = 12;

    Solution solution;

    std::vector<int> result = solution.twoSum(nums, target);
    std::cout << "[" << result.at(0) << " " << result.at(1) << "]" << std::endl;

    return 0;
}
```

<br />

`rust (Iterative Brute Force)`
```rust
fn main() {
    let nums = vec![3, 8, 2, -12, 24];
    let target: i32 = 12;

    let solution = two_sum(&nums, &target);
    println!("{:?}", solution);
}

fn two_sum(nums: &Vec<i32>, target: &i32) -> Vec<i32> {
    for i in 0..nums.len() {
        for j in (i + 1)..nums.len() {
            if nums[i] == target - nums[j] {
                let index_i: i32 = i.try_into().unwrap();
                let index_j: i32 = j.try_into().unwrap();
                return vec![index_i, index_j];
            }
        }
    }
    return Vec::new();
}
```

<br />

`go (Iterative Brute Force)`
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
			if nums[j] == target-nums[i] {
				return []int{i, j}
			}
		}
	}
	return []int{}
}
```

<br />

`python3 (Iterative Brute Force)`
```py
def main():
    nums = [3, 8, 2, -12, 24]
    target = 12
    solution = Solution().twoSum(nums, target)
    print(solution)

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(0, len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[i] == target - nums[j]:
                    return [i,j]
        return []
```

<br />

`javascript (Iterative Brute Force)`
```js
function main() {
    const nums = [3, 8, 2, -12, 24];
    const target = 12;

    const solution = twoSum(nums, target);
    console.log(solution);
};

function twoSum(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        for (let j = i + 1; j < nums.length; j++) {
            if (nums[j] === target - nums[i]) {
                return [i, j];
            }
        }
    }
    return [];
};

main();
```

<br />

`lua (Iterative Brute Force)`
```lua
function main()
	local nums = { 3, 8, 2, -12, 24 }
	local target = 12

	local solution = two_sum(nums, target)
	print("[" .. solution[1] .. " " .. solution[2] .. "]")
end

function two_sum(nums, target)
	for i = 1, #nums do
		for j = i + 1, #nums do
			if nums[i] == target - nums[j] then
				return { i, j }
			end
		end
	end
	return { 0, 0 }
end

main()
```