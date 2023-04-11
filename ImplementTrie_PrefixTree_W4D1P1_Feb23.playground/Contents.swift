//MARK: - Implement Trie (Prefix Tree)

// Link: https://leetcode.com/problems/implement-trie-prefix-tree/
// A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
// Implement the Trie class:
// Trie() Initializes the trie object.
// void insert(String word) Inserts the string word into the trie.
// boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
// boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.


//MARK: - Approach

// Implement a tree data structure where each node has a dictionary storing all descendants having a common prefix. Each node holds 'isEndOfWord' to indicate if it is a last character of a word.


//MARK: - Complexity

//- Time complexity:
// O(m) where m is the length of a target string
//
//- Space complexity:
// insert - O(m), search - O(1), startsWith - O(1)


//MARK: - Code

import Foundation

fileprivate class TrieNode {
    var children = [Character: TrieNode]()
    var isEndOfWord = false
}

class Trie {
    private let root = TrieNode()
    
    func insert(_ word: String) {
        var cur = root
        for char in word {
            if cur.children[char] == nil {
                cur.children[char] = TrieNode()
            }
            cur = cur.children[char]!
        }
        cur.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        var cur = root
        for char in word {
            if cur.children[char] == nil {
                return false
            }
            cur = cur.children[char]!
        }
        return cur.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for char in prefix {
            if cur.children[char] == nil {
                return false
            }
            cur = cur.children[char]!
        }
        return true
    }
}


//MARK: - Testing Sample Data

//1. ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
//   [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]

let trie = Trie()
trie.insert("apple")
trie.search("apple") // return true
trie.search("app") // return false
trie.startsWith("app") // return true
trie.insert("app")
trie.search("app") // return true
