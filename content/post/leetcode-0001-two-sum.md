+++
date = "2025-05-25T16:43:10-05:00"
draft = false
title = "Leetcode 0001 Two Sum"
+++

## Iterative Brute Force
### Summary
Given an array of integers `nums` and an integer `target`, return the indices of the two numbers 
such that they add up to `target`.

### Process
- Descend through `nums`, iterating from index `0`.
- Within the first loop, descend through `nums` once more, this time iterating from index `1`.
- If the difference of `target` and the inner value equals the outer value, return each index.
- If both loops complete without a successful comparison, return empty.

|Metrics|Time Complexity|Space Complexity|
|----------|----|-----|
|Worst|O(n^2)|O(1)|
|Average|𝚹(n^2)|𝚹(1)|
|Best|Ω(1)|Ω(1)|

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
