//
//  两数之和.swift
//  suanfa
//
//  Created by Netban on 2019/11/29.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
//
//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//
//你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
//
//示例:
//
//给定 nums = [2, 7, 11, 15], target = 9
//
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/two-sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



/// 暴利破解法 直接遍历相加
/// - Parameter nums: 数组
/// - Parameter target: 目标值
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< (nums.count - 1){
        for j in (i + 1) ... (nums.count - 1){
            if nums[i] + nums[j] == target {
                return [i,j]
            }
        }
    }
    return []
}
/*
 执行用时 :604 ms, 在所有 swift 提交中击败了 25.61%的用户,内存消耗 :21 MB, 在所有 swift 提交中击败了5.12%的用户
 */



/// 通过 字典来算  key 是 数组里的 元素, value 是下标
/// 一次遍历, 在遍历的时候 一遍通过 target - 遍历元素 的职 做key 查找有没有对应的key,一遍给 字典 赋值, 比如 如果是 [1,5],这种方法返回的是[5,1]也可以交换顺序
/// - Parameter nums: 数组
/// - Parameter target: 目标值
func twoSums(_ nums: [Int], _ target: Int) -> [Int] {
    var dic = [Int:Int]()
    for (index,value) in nums.enumerated(){
        let subValue = target - value
        if let otherIndex = dic[subValue]{
            return [otherIndex,index]
        }
        dic[value] = index
    }
    return []
}
