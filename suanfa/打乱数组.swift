//
//  打乱数组.swift
//  suanfa
//
//  Created by Netban on 2019/11/28.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
// 打乱一个没有重复元素的数组

//// 以数字集合 1, 2 和 3 初始化数组。
//int[] nums = {1,2,3};
//Solution solution = new Solution(nums);
//
//// 打乱数组 [1,2,3] 并返回结果。任何 [1,2,3]的排列返回的概率应该相同。
//solution.shuffle();
//
//// 重设数组到它的初始状态[1,2,3]。
//solution.reset();
//
//// 随机返回数组[1,2,3]打乱后的结果。
//solution.shuffle();



/// 想法 使用一个 数组 来存储初始值
/// 随机产生下标,让遍历的 值 和 随机产生下标的值交换
class Solution {
    var originArr:[Int]
    var nums:[Int]
    let count:Int
    init(_ nums: [Int]) {
        self.originArr = nums
        self.nums = nums
        count = nums.count
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return originArr
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        for index in 0 ..< count {
           
            let randomIndex = Int.random(in: 0 ..< count)
            print(randomIndex)
            // 交互两个数
            let temp = nums[index]
            nums[index] = nums[randomIndex]
            nums[randomIndex] = temp
        }
         return nums
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
