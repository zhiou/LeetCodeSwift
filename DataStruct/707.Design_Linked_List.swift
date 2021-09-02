/*
 * @lc app=leetcode.cn id=707 lang=swift
 *
 * [707] 设计链表
 */

// @lc code=start

class MyListNode {
    var val: Int
    var next: MyListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    init(_ val: Int, _ next: MyListNode?) {
        self.val = val
        self.next = next
    }
}

class MyLinkedList {

    /** Initialize your data structure here. */
    private var head: MyListNode

    init() {
        head = MyListNode(-1)
    }

    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var current: MyListNode? = head
        var count = index

        while count >= 0, current != nil {
            current = current?.next
            count -= 1
        }
        
        return current?.val ?? -1
    }

    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        self.head.next = MyListNode(val, head.next)
    }

    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        var current: MyListNode? = head

        while current != nil, current?.next != nil {
            current = current?.next
        }
        current?.next = MyListNode(val)
    }

    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        var current: MyListNode? = head
        var count = index

        while count > 0, current != nil {
            current = current?.next
            count -= 1
        }

        current?.next = MyListNode(val, current?.next)
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        var current: MyListNode? = head
        var count = index

        while count > 0, current != nil {
            current = current?.next
            count -= 1
        }

        current?.next = current?.next?.next
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
// @lc code=end

