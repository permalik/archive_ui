---
type: TechDoc
title: Insertion Sort List
description: "Dynamic Programming: LeetCode"
tags: ['tech', 'dsa', 'leetcode', 'c', 'go', 'csharp']
publishedAt: 11-06-2024
updatedAt: 11-24-2024
url: leetcode-0147-insertion-sort-list
---
## Summary

### Iterative and Intuitive
Iterate the original list with a temporary sorted list and a variable tracking the node from the
original list. Find the correct position for the current node and insert it. Once all nodes have
been inserted their sorted positions, return the sorted list.

#### Steps
Define a node struct from which lists will be created.
- each value is an integer
- each next is a pointer to the next node in the list
A function creates a linked list, accepting an array of integers and an array length.
- return early if the array is empty
- create the head of the new linked list
  - allocate enough memory for the size of a list node
  - the value of head is assigned the first element from the input array
  - the next of head points to null (indicating the end of the list)
- create a new node to track the current position while iterating to build the list
  - the current node begins with the value of head and points to newly allocated node
  - the newly allocated node being pointed to is then assigned the next value of the array and
points to NULL (indicating the end of the list when no more values are left in the source array)
  - the node tracking current position now takes the value of newly built node
- return the head of the list, representing the start of the linked list
A function sorts the linked list, accepting a pointer to the head of the unsorted linked list.
- return head early if the list is empty or has only one element
- create a temporary sorted list head with an empty node
- create a pointer to iterate through the original list
- temporarily store the next node of the original list before re-linking in sorted order
- iterate until finding the correct position to insert the current node
- insert the current node into the sorted list
- move to the next node in the original list and repeat until fully sorted
- return the sorted list

##### Complexity Analysis
**Time:** O(n^2)
**Space:** O(1)

## Implementation
**c (Iterative and Intuitive)**
```c
struct ListNode {
    int val;
    struct ListNode *next;
};

struct ListNode* linked_list(int arr[], int len) {
    if (len == 0) {
        return NULL;
    }

    struct ListNode* head = (struct ListNode*)malloc(sizeof(struct ListNode));
    head->val = arr[0];
    head->next = NULL;

    struct ListNode* curr = head;

    for (int i = 1; i < len; i++) {
        curr->next = (struct ListNode*)malloc(sizeof(struct ListNode));
        curr->next->val = arr[i];
        curr->next->next = NULL;

        curr = curr->next;
    }

    return head;
}

struct ListNode* insertion_sort_list(struct ListNode* head) {
    if (!head || !head->next) {
        return head;
    }

    struct ListNode* sorted_head = malloc(sizeof(struct ListNode));
    sorted_head->next = NULL;

    struct ListNode* current = head;
    while (current) {
        struct ListNode* next_node = current->next;
        struct ListNode* sorted_current = sorted_head;

        while (sorted_current->next && sorted_current->next->val < current->val) {
            sorted_current = sorted_current->next;
        }

        current->next = sorted_current->next;
        sorted_current->next = current;

       current = next_node;
    }

    struct ListNode* sorted_list = sorted_head->next;
    free(sorted_head);

    return sorted_list;
}

int main(void) {
    int arr[] = { 4, 2, 1, 3 };
    int len = sizeof(arr) / sizeof(arr[0]);
    struct ListNode* input_list = linked_list(arr, len);
    struct ListNode* solution = insertion_sort_list(input_list);

    struct ListNode* tmp = solution;
    printf("[");
    while (tmp != NULL) {
        printf(" %d", tmp->val);
        tmp = tmp->next;
    }
    printf(" ]\n");

    return 0;
}
```
<!--

<br />

**go (Iterative and Intuitive)**
```go
type ListNode struct {
        Val  int
        Next *ListNode
}

func main() {
        arr := []int{4, 2, 1, 3}
        head := linkedList(arr)
        solution := insertionSortList(head)

        fmt.Printf("[")
        curr := solution
        for curr != nil {
                fmt.Printf("%d", curr.Val)
                curr = curr.Next
                if curr != nil {
                        fmt.Printf(" ")
                }
        }
        fmt.Printf("]\n")
}

func insertionSortList(head *ListNode) *ListNode {
        if head == nil {
                return head
        }

        sorted := &ListNode{}
        curr := head

        for curr != nil {
                prev := sorted
                next := curr.Next

                for prev.Next != nil && prev.Next.Val < curr.Val {
                        prev = prev.Next
                }

                curr.Next = prev.Next
                prev.Next = curr

                curr = next
        }
        return sorted.Next
}

func linkedList(arr []int) *ListNode {
        if len(arr) == 0 {
                return nil
        }

        head := &ListNode{Val: arr[0]}
        curr := head

        for _, j := range arr[1:] {
                curr.Next = &ListNode{Val: j}
                curr = curr.Next
        }

        return head
}
```

<br />

**c# (Iterative and Intuitive)**

```csharp
namespace Solution
{
    public class ListNode
    {
        public int val;
        public ListNode? next;
        public ListNode(int val = 0, ListNode? next = null)
        {
            this.val = val;
            this.next = next;
        }
    }
    public class Program
    {
        public static void Main()
        {
            int[] arr = new int[] { 4, 2, 1, 3 };
            int len = arr.Length;

            ListNode input_list = LinkedList(arr, len);
            ListNode solution = InsertionSortList(input_list);

            Console.Write("[");
            ListNode curr = solution;
            while (curr != null)
            {
                Console.Write(curr.val);
                curr = curr.next!;
                if (curr != null)
                {
                    Console.Write(", ");
                }
            }
            Console.WriteLine("]");
        }

        public static ListNode LinkedList(int[] arr, int len)
        {
            if (len == 0)
            {
                return new ListNode();
            }

            ListNode head = new ListNode(arr[0]);
            ListNode curr = head;
            for (int i = 1; i < len; i++)
            {
                curr.next = new ListNode(arr[i]);
                curr = curr.next;
            }

            return head;
        }

        public static ListNode InsertionSortList(ListNode head)
        {
            if (head == null || head.next == null)
            {
                return head!;
            }

            ListNode sorted_head = new ListNode(0);
            ListNode curr = head;

            while (curr != null)
            {
                ListNode next_node = curr.next!;

                ListNode sorted_curr = sorted_head;
                while (sorted_curr.next != null && sorted_curr.next.val < curr.val)
                {
                    sorted_curr = sorted_curr.next;
                }

                curr.next = sorted_curr.next;
                sorted_curr.next = curr;

                curr = next_node;
            }

            return sorted_head.next!;
        }
    }
}
```
-->
