//MARK: - Copy List with Random Pointer

// Link: https://leetcode.com/problems/copy-list-with-random-pointer/
// A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null. Construct a deep copy of the list.


//MARK: - Approach
//1. Create copy of each node and insert it between the current and next node.(dupNode.next = currNode.next, currNode.next = dupNode)
//2. Assign random nodes for each duplicated nodes with the duplicated random node(currNode.random.next)
//4. Hold the duplicated head(currNode.next) in a variable and relink the actual pointers(currNode.next = dupNode.next, dupNode.next = currNode.next.next)
//3. Return the newHead


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

//Definition for a Node.
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
          self.random = nil
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        
        // duplicate nodes
        var currNode = head
        while currNode != nil {
            var newNode = Node(currNode!.val)
            newNode.next = currNode!.next
            // newNode.random = currNode!.random
            currNode!.next = newNode
            currNode = newNode.next
        }
        
        // point to actual Random Nodes
        currNode = head
        var newHead = head?.next
        while currNode != nil {
            var dupNode = currNode!.next
            dupNode!.random = currNode!.random?.next
            currNode = dupNode!.next
        }
        
        // take out the copied nodes
        currNode = head
        while currNode != nil {
            var dupNode = currNode!.next
            currNode!.next = dupNode!.next
            dupNode!.next = currNode!.next?.next
            
            currNode = currNode!.next
        }
        return newHead
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
let head1 = Node(7)
let node1_1 = Node(13)
let node1_2 = Node(11)
let node1_3 = Node(10)
let node1_4 = Node(1)

head1.next = node1_1
node1_1.next = node1_2
node1_1.random = head1
node1_2.next = node1_3
node1_3.next = node1_4
node1_3.random = node1_2
node1_4.random = head1
solution.copyRandomList(head1) // [[7,null],[13,0],[11,4],[10,2],[1,0]]


//2. head = [[1,1],[2,1]]
let head2 = Node(1)
let node2_1 = Node(2)

head2.next = node2_1
node2_1.random = node2_1
solution.copyRandomList(head2) // [[1,1],[2,1]]


//3. head = [[3,null],[3,0],[3,null]]
let head3 = Node(3)
let node3_1 = Node(3)
let node3_2 = Node(3)

head3.next = node3_1
node3_1.next = node3_2
node3_1.random = head3
solution.copyRandomList(head3) // [[3,null],[3,0],[3,null]]
