---
type: TechDoc
title: Insertion Sort
description: "Algorithm Summary and Implementation"
tags: ['tech', 'dsa', 'insertion_sort', 'go']
publishedAt: 07-14-2024
updatedAt: 10-27-2024
url: dsa-insertion-sort
---
## Summary
Begin with an array of integers.  
Instantiate a variable containing array's size.  
Iterate the array from `a[1]` to `a[n]`.  
Track the primary index at `a[1]` and increment its value with each iteration.  
Store the value of the primary index in a variable which will be updated with each passing iteration.  
Track an additional index which maps to that immediately before the primary index.  
Loop, shifting all higher value integers to the right.  
Insert the temporary value into the remaining location.

## Implementation
`go`
```go
func insertionSort(arr *[9]int, len int) {
    for i := 1; i < len; i++ {
        tmp := arr[i]
        j := i - 1

         for j >= 0 && arr[j] > tmp {
             arr[j+1] = arr[j]
             j--
         }
         arr[j+1] = tmp
    }
}

func main() {
    array := [9]int{5, 7, 3, 6, 1, 4, 9, 8, 2}
    length := len(array)
    insertionSort(&array, length)
}
```
