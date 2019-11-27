//
//  移动0.swift
//  suanfa
//
//  Created by Netban on 2019/11/27.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
//"""
//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//
//示例:
//
//输入: [0,1,0,3,12]
//输出: [1,3,12,0,0]
//说明:
//
//必须在原数组上操作，不能拷贝额外的数组。
//尽量减少操作次数。
//"""



/// 思路是 找到第一个 0 和费零数交换位置
/// 外层遍历到 0 的元素
/// 内存遍历到不是 0 的元素 交换位置
/// - Parameter nums: 数组
func moveZeroes(_ nums: inout [Int]) {
    for i in 0 ..< (nums.count-1){
        if nums[i] == 0 {
            for j in (i+1) ..< nums.count{
               if nums[j] != 0 {
                   let temp = nums[j]
                    nums[j] = nums[i]
                    nums[i] = temp
                break
               }
            }
        }
    }
    
    print("移动0\(nums)")
}


/// 用时比较少的一种解法
/// 先循环一遍 把 不是 0 的元素 都提到最前面
/// 根据 最后不是 0 的坐标 后面都设置成 0
/// [0,1,0,3,12]
/// i = 0
/// i = 1 [1,1,0,3,12] lastNotZeroAtIndex = 1
/// i = 2
/// i = 3 [1,3,0,3,12] lastNotZeroAtIndex = 2
/// i = 4 [1,3,12,3,12] lastNotZeroAtIndex = 3
/// 最后 将 lastNotZeroAtIndex 后面的数 全部 补 0
/// [1,3,12,0,0]
/// - Parameter nums: 数组
func moveZeroes2(_ nums: inout [Int]) {
    var lastNotZeroAtIndex = 0
    for i in 0 ... (nums.count - 1){
        if nums[i] != 0 {
            nums[lastNotZeroAtIndex] = nums[i]
            lastNotZeroAtIndex += 1
        }
    }
    
    var j = lastNotZeroAtIndex
    while j < nums.count {
        nums[j] = 0
        j += 1
    }
    
    print("移动0\(nums)")
}
