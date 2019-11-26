//
//  乘积最大子序列.swift
//  suanfa
//
//  Created by Netban on 2019/11/26.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
//给定一个整数数组 nums ，找出一个序列中乘积最大的连续子序列（该序列至少包含一个数）。


/// 暴利破解法 所有元素相乘 n! + (n-1)! + .... + 1
/// 放到数组里 求最大值
/// 超出了时间限制,尴尬
/// - Parameter nums: 数组
func maxProduct(_ nums: [Int]) -> Int {
    
    let end = nums.count - 1
    var tempNum = [Int]()
    for (index,value) in nums.enumerated(){
        tempNum.append(value)
        if index < nums.count-1{
            let start = index + 1
            var mul = value
            for valueB in nums[start...end]{
                mul =  mul * valueB
                tempNum.append(mul)
            }
        }
    }
    print(tempNum)
    let max = tempNum.max()
    return max!
}


/// 正向 乘一遍 的最大值 和 反向乘一遍的最大值 中的最大值就是 最大子序列的乘积了
/// 理由 一个序列中不存在 为0 的情况时
/// 如果都是正数, 最大值就是全部数乘积
/// 如果有一个负数,就是 负数前面的子序列 和 负数后面的子序列 中 的乘积 的最大值
/// 如果有偶数个负数, 就是全部序列的成绩
/// 如果 有奇数个  就是 正向乘到最后一个负数 和 反向乘到最后一个负数的乘积的最大值,
///
/// 当出现0 的情况,就相当于分片 [1,2,3,0,1,3,4] 分为[1,2,3] 和 [1,3,4] 使用 maxA 和 maxB 来记录谁是最大值
///
/// - Parameter nums: <#nums description#>
func maxProduce2(_ nums:[Int]) -> Int {
    let end = nums.count - 1
    var a = 1
    var b = 1
    var maxA = nums[0]
    var maxB = nums[end]
    
    for i  in 0...end {
        a = a * nums[i]
        if maxA < a { maxA = a}
        if nums[i] == 0{ a = 1}
        
        b = b * nums[end - i]
        if maxB < b {maxB = b}
        if nums[end - i] == 0{b = 1}
    }
    
    return max(maxA, maxB)
}
