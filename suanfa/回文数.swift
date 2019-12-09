//
//  回文数.swift
//  suanfa
//
//  Created by Netban on 2019/12/9.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

//回文数
// 简单的办法
//执行用时 :
//88 ms
//, 在所有 swift 提交中击败了
//10.67%
//的用户
//内存消耗 :
//20.9 MB
//, 在所有 swift 提交中击败了
//5.03%
//的用户
func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else {
        return false
    }
    let s = String(x)
    var temp = Array(s)
    temp.reverse()
    let y = Int(String(temp))
    return y == x
}


//执行用时 :
//32 ms
//, 在所有 swift 提交中击败了
//97.87%
//的用户
//内存消耗 :
//20.7 MB
//, 在所有 swift 提交中击败了
//5.03%
//的用


/// 思路 让 x 每次缩小十倍 12321 -> 1232 -> 123 -> 12
///     让 temp 每次扩大十倍 + x 的余数 ,余数就是从个位数 开始,每次缩小十倍的数, 当着两个数 想等的时候,就是回文数(偶数),或者 temp / 10 = x 的时候(奇数)就是回文数
/// - Parameter x:
func isPalindromes(_ x: Int) -> Bool {
    // < 0 和能被整除的
    
    if x < 0 || (x % 10 == 0 && x != 0){
        return false
    }
    
    var end = 0
    var compare = x
    
    while compare > end {
        end = end * 10 + compare % 10
        compare = compare / 10
    }
    
    return compare == end || compare == end / 10
}
