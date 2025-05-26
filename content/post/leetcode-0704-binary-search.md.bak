---
type: TechDoc
title: Binary Search
description: "Dynamic Programming: LeetCode"
tags: ['tech', 'dsa', 'binary_search', 'go']
publishedAt: 11-25-2024
updatedAt: 01-05-2025
url: leetcode-0704-binary-search
---
## Summary
### Iterative
Given an array of integers `nums` which is sorted in ascending order, 
and an integer `target`, write a function searching for `target` in `nums`. 
If `target` exists, return its index. Otherwise, return `-1`.

#### Steps
Store the indices of the first and last elements of the collection: `low`, `high`.

Iterate while `low` is less than or equal to `high`.

Store the index of the middle element: `mid`. Return `mid` if its value matches `target`.

If the value of `mid` is greater than that of `target`, store the index of `mid` minus one in `high`.

Else if the value of `mid` is less than that of `target`, store the index of `mid` plus one in `low`.

If all iterations complete without returning `mid` as the solution, return `-1`.

##### Complexity Analysis
**Time:** O(log n)
**Space:** O(1)

### Implementation
**C (Iterative)**
```c
int search(int nums[], int len, int target) {
    int l = 0;
    int h = len - 1;

    while (l <= h) {
        int m = (h + l) / 2;
        if (nums[m] == target) {
            return m;
        }
        if (nums[m] > target) {
            h = m - 1;
        } else {
            l = m + 1;
        }
    }

    return -1;
}

int main(void) {
    int nums[] = { -1, 0, 3, 5, 9, 12 };
    int target = 9;
    int len = sizeof(nums) / sizeof(nums[0]);

    int s = search(nums, len, target);
    printf("%d\n", s);

    return 0;
}
```
<!--

<br />

**go (Iterative)**
```go
func main() {
	nums := []int{-1, 0, 3, 5, 9, 12}
	target := 9
	s := binary_search(nums, target)
	fmt.Println(s)
}

func binary_search(nums []int, target int) int {
	low := 0
	high := len(nums) - 1

	for low <= high {
		mid := (high + low) / 2
		if nums[mid] == target {
			return mid
		}
		if nums[mid] > target {
			high = mid - 1
		} else {
			low = mid + 1
		}
	}
	return -1
}
```

<br />

**c# (Iterative)**
```csharp
namespace Solution
{
    public class Program
    {
        public static void Main()
        {
            int[] nums = new int[] { -1, 0, 3, 5, 9, 12 };
            int target = 9;

            int s = Search(nums, target);
            Console.WriteLine(s);
        }

        public static int Search(int[] nums, int target)
        {
            int l = 0;
            int h = nums.Length - 1;

            while (l <= h)
            {
                int m = (h + l) / 2;
                if (nums[m] == target)
                {
                    return m;
                }
                if (nums[m] > target)
                {
                    h = m - 1;
                }
                else
                {
                    l = m + 1;
                }
            };

            return -1;
        }
    }
}
```
-->
