//MARK: - LRU Cache

// Link: https://leetcode.com/problems/lru-cache/
// Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
// Implement the LRUCache class:
// LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
// int get(int key) Return the value of the key if the key exists, otherwise return -1.
// void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
// The functions get and put must each run in O(1) average time complexity.


//MARK: - Approach

// The idea is to store all the Key-Value pairs in the form of nodes of a doubly-linked list arranged in a sequential manner so that adding/removing a Key-Value pair can take place in O(1) time. Also, we will store the Key-Node pairs in the 'Map' that maps the key with its associated node, so that we can access any node in O(1) time.
// Maintain a predefined head and tail initialized to Node(0,0), to act reference points between most recent and least recent elements.

// Put Operation
// The implementation of the put operation is as follows -
//1. Let's say the ask is to add a(key, value) pair in the cache.
//2. The first step would be to check if the cache already has a node with its Key being key.
//3. If such node already exists do the following:
    //3.1 Update node's value to value.
    //3.2 Move it to the head of the List, because while updating the value we have accessed it, due to which it becomes the most recently used Key-value pair.
//4. Otherwise do the following:
    //4.1 Define a new node with given values of key and value (let it be newNode).
    //4.2 Add it to the head of the list.
    //4.3 Add it to the Map.
    //4.4 If after adding newNode size of the list exceeds the capacity of cache, do the following:
        //4.4.1 Remove node present at the tail of the List (since it is the least recently used Key-Value pair).
        //4.4.2 Remove it from the map.

// Get Operation
// The implementation of the get operation is as follows -
//1. Let's say the ask is to find the value of a node with its Key being key.
//2. So check if the map contains any node with the corresponding key.
//3. If such node does not exist, return the default value −1.
//4. Otherwise, move the node to the head of the list, this is because while performing the get operation they have been accessed due to which they are the most recently used Key-Value pair.


//MARK: - Complexity

//- Time complexity:
// O(1)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class LRUCache {
    private let capacity: Int
    private var count = 0

    private let head = LRUCacheNode(0, 0)
    private let tail = LRUCacheNode(0, 0)
    private var dict = [Int: LRUCacheNode]()

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(key)
            insert(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            remove(key)
            insert(node)
            return
        }
        let node = LRUCacheNode(key, value)
        dict[key] = node
        if count == capacity, let tailKey = tail.pre?.key {
            remove(tailKey)
        }
        insert(node)
    }

    private func insert(_ node: LRUCacheNode) {
        dict[node.key] = node

        node.pre = head
        node.next = head.next
        head.next = node
        node.next?.pre = node

        count += 1
    }

    private func remove(_ key: Int) {
        guard count > 0, let node = dict[key] else {
            return
        }
        dict[key] = nil

        node.pre?.next = node.next
        node.next?.pre = node.pre
        node.pre = nil
        node.next = nil

        count -= 1
    }

}


fileprivate class LRUCacheNode {
    let key: Int
    var val: Int

    var pre: LRUCacheNode?
    var next: LRUCacheNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}


//MARK: - Testing Sample Data

//1. ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//   [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
let cache = LRUCache(2)
cache.put(1, 1) // cache is {1=1}
cache.put(2, 2) // cache is {1=1, 2=2}
cache.get(1)    // return 1
cache.put(3, 3) // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
cache.get(2)    // returns -1 (not found)
cache.put(4, 4) // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
cache.get(1)    // return -1 (not found)
cache.get(3)    // return 3
cache.get(4)    // return 4
