//
//  两数相加.swift
//  suanfa
//
//  Created by Netban on 2019/12/2.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

//
//给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/add-two-numbers
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807

// 链表
public class ListNode{
    public var val:Int
    public var next:ListNode?
    public init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}



/// 思路 模拟正常的数学 家法, 记得要向前 进 1位, 和 对应位数 相加 大于10 的情况
/// - Parameter l1: 链1
/// - Parameter l2: 链2
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let rootNode = ListNode(0)
    var nodeOne = l1
    var nodeTwo = l2
    var temp = rootNode
    var max10 = 0
    while (nodeOne != nil || nodeTwo != nil){
        let one = nodeOne?.val
        let two = nodeTwo?.val
        
        let sum:Int = (one ?? 0) + (two ?? 0) + max10
        let current = sum % 10  // 余数作为当前值
        max10 = sum / 10  //结果是否向前 + 1
        temp.next = ListNode(current)
        nodeOne = nodeOne?.next
        nodeTwo = nodeTwo?.next
        temp = temp.next!
        
    }
    // 此时要判断, 是否最后相加要向前进 1
    if max10 > 0 {
        temp.next = ListNode(1)
    }
    return rootNode.next
}


/// 这是递归做的
/// - Parameter l1:
/// - Parameter l2:
func addTwoNumberss(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else { return l2 }
    guard let l2 = l2 else { return l1 }
    
    let node = ListNode(0)
    node.val = (l1.val + l2.val) % 10
    if l1.val + l2.val > 9 {
        node.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next), ListNode(1))
    } else {
        node.next = addTwoNumbers(l1.next, l2.next)
    }
    return node
}
