/*  2. Add Two Numbers
    You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
    You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
    Example
 
    Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 0 -> 8
    Explanation: 342 + 465 = 807.
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// Runtime Error
class Solution1 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var num1 = 0, num2 = 0, sum = 0
        var listNode1 = l1, listNode2 = l2
        let dummy = ListNode(0)
        var sumListNode = dummy
        while listNode1 != nil {
            num1 = num1 * 10 + listNode1!.val
            listNode1 = listNode1?.next
        }
        while listNode2 != nil {
            num2 = num2 * 10 + listNode2!.val
            listNode2 = listNode2?.next
        }
        num1 = Int(String(String(num1).reversed()))!
        num2 = Int(String(String(num2).reversed()))!
        sum = num1 + num2
        while sum != 0 {
            sumListNode.next = ListNode(sum % 10)
            sumListNode = sumListNode.next!
            sum = sum / 10
        }
        return dummy.next
    }
}

// Runtime: 84ms
class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var listNode1 = l1, listNode2 = l2
        let dummy = ListNode(0)
        var sumListNode = dummy
        var sum = 0
        
        while listNode1 != nil || listNode2 != nil {
            sum /= 10
            
            if let list = listNode1 {
                sum += list.val
                listNode1 = list.next
            }
            
            if let list = listNode2 {
                sum += list.val
                listNode2 = list.next
            }
            
            sumListNode.next = ListNode(sum % 10)
            if let list = sumListNode.next {
                sumListNode = list
            }
        }
        
        if sum / 10 == 1 {
            sumListNode.next = ListNode(1)
        }
        return dummy.next
    }
}

// Runtime: 80ms
class  Solution3 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var listNode1 = l1, listNode2 = l2
        var sum = 0, carry = 0
        let dummy = ListNode(0)
        var sumListNode = dummy
        
        while listNode1 != nil || listNode2 != nil || carry != 0 {
            sum = carry
            
            if listNode1 != nil {
                sum += listNode1!.val
                listNode1 = listNode1!.next
            }
            
            if listNode2 != nil {
                sum += listNode2!.val
                listNode2 = listNode2!.next
            }
            
            carry = sum / 10
            
            sumListNode.next = ListNode(sum % 10)
            sumListNode = sumListNode.next!
        }
        
        return dummy.next
    }
}

