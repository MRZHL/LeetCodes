//
//  寻找两个有序数组的中位数.swift
//  suanfa
//
//  Created by Netban on 2019/12/4.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

/*
给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。

示例 1:

nums1 = [1, 3]
nums2 = [2]

则中位数是 2.0
示例 2:

nums1 = [1, 2]
nums2 = [3, 4]

则中位数是 (2 + 3)/2 = 2.5

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

// 思路 合并两个数组,再取中位数
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    // 只排序到 count / 2 位置上的书
    func paixu(_ num1:[Int],_ num2:[Int]) -> [Int]{
        var result = [Int]()
        var i = 0
        var j = 0
        while i < num1.count && j < num2.count {
            if num1[i] < num2[j] {
                result.append(num1[i])
                i += 1
            }else{
                result.append(num2[j])
                j += 1
            }
        }
        
        while i < num1.count {
            result.append(num1[i])
            i += 1
        }
        
        while j < num2.count {
            result.append(num2[j])
            j += 1
        }
        print(result)
        return result
    }
    
    let temp = paixu(nums1, nums2)
    print("hahaha")
    guard temp.count > 1 else {
        return Double(temp[0])
    }
    if temp.count % 2 == 0{
        return Double((temp[temp.count/2] + temp[temp.count/2 - 1])) / 2.0
    }else{
        return Double(temp[temp.count/2])
    }
}

