//MARK: - Sort List

// Link: https://leetcode.com/problems/sort-list/
// Given the head of a linked list, return the list after sorting it in ascending order.


//MARK: - Approach
// Merge sort for linked lists is preferred to sort linked lists because accessing a random node in a linked list is a costly operation which makes other algorithms like quicksort, heapsort, etc inefficient.
//The algorithm of merge sort for linked lists is quite similar to sorting an array using merge sort. We will be having a recursive function 'sortList' which divides the list into two halves and recurse back for the left and the right half. After that, we will have another function 'merge' which will be used to merge the sorted parts.

//The steps required in the algorithm are as follows - mergeSort(head) -

//1. Let the function be sortList that accepts a single argument head which denotes the pointer to the head of the linked list.
//2. In the function, check if the head itself is null or if the list with its head node as head consists of only one node. If any of the above conditions is found to be true, we will simply return head.
//3. Now we will find the middle node of the liked list using another funcion 'getMid' which uses slow and fast pointers to return the mid.
//4. Now we will divide the list into two halves, therefore we will remove the next link of the mid node i.e. mid.next = null.
//5. Recur for the left and right half of the partitioned list, let the node returned by them be left and right respectively.
//6. Call the 'merge' function to merge the sorted left part and the sorted right part. Let after merging two individually sorted parts, the head node of the combined linked list is answer.
//7. Return the answer node which represents the head of the sorted linked list.
//8. The steps required to merge the sorted parts are as follows - mergeSorted(left, right) -
    //8.1 Let the function 'merge' accepts two arguments of node type left and right denoting the head of two independent sorted lists.
    //8.2 Maintain a node type variable 'dummy' and another node type variable node that will point to dummy. The dummy will help to return the answer at the end of the function and the node is required to traverse the list.
    //8.3 Use a while loop to traverse until either of the left or rightpointer does not point to null and do the following,
        //8.3.1 Check if left.val is smaller than right.val, then assign left to 'tail.next' and move left pointer to left.next
        //8.3.2 else, assign right to 'tail.next' and move right pointer to right.next
    //8.4 Now include the nodes left out in the lists after exiting from loop, by either assigning tail.next to left or right, whichever list is not nil.
    //8.1 Return the dummy.next pointer node.


//MARK: - Complexity

//- Time complexity:
// O(nlogn)
//
//- Space complexity:
// O(logn)


//MARK: - Code

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        // divide
        var left = head
        var right = getMid(head)
        var tmp = right?.next
        right?.next = nil
        right = tmp

        left = sortList(left)
        right = sortList(right)

        // conquer
        return merge(left, right)
    }

    private func getMid(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    private func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var left = left, right = right
        var dummy = ListNode(), tail = dummy
        while left != nil && right != nil {
            if left!.val < right!.val {
                tail.next = left
                left = left!.next
            } else {
                tail.next = right
                right = right!.next
            }
            tail = tail.next!
        }
        if left != nil {
            tail.next = left
        }
        if right != nil {
            tail.next = right
        }
        return dummy.next
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. head = [4,2,1,3]
let head1 = ListNode(4)
let node1_1 = ListNode(2)
let node1_2 = ListNode(1)
let node1_3 = ListNode(3)

head1.next = node1_1
node1_1.next = node1_2
node1_2.next = node1_3
solution.sortList(head1) // [1,2,3,4]


//2. head = [-1,5,3,4,0]
let head2 = ListNode(-1)
let node2_1 = ListNode(5)
let node2_2 = ListNode(3)
let node2_3 = ListNode(4)
let node2_4 = ListNode(0)

head2.next = node2_1
node2_1.next = node2_2
node2_2.next = node2_3
node2_3.next = node2_4
solution.sortList(head2) // [-1,0,3,4,5]


//3. head = []
let head3: ListNode? = nil
solution.sortList(head3) // []
