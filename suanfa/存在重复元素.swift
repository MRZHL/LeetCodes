//
//  存在重复元素.swift
//  suanfa
//
//  Created by Netban on 2019/11/27.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

// 最简单的方法
func containsDuplicate(_ nums: [Int]) -> Bool {
    let set = Set(nums)
    let result = set.count == nums.count
    return !result
}

// 排序,比较相邻的是否一样
//
func containsDuplicate2(_ nums: [Int]) -> Bool {
    //
    guard nums.count > 0 else {
        return false
    }
    
    let tempArr = nums.sorted()
    for i in  0..<(tempArr.count - 1){
        if tempArr[i] == tempArr[i+1]{
            return true
        }
    }
    
    return false
}
