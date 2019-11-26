//
//  旋转数组.swift
//  suanfa
//
//  Created by Netban on 2019/11/26.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation


/// 相当于把后面的几个数放到了前面
/// 当 k > 数组个数的时候 表示 已经旋转了一圈, 又开始了一遍 需要用余数
/// 当 余数 == 0 整除刚好是一圈 不需要变动
/// 不是 0 的时候, 就获取 需要调整的子数组 插入到前面, 把后面的子数组 删除
/// - Parameter nums: 数组
/// - Parameter k: 后面的几个数组
func rotate(_ nums:[Int], _ k: Int) {
    
    if nums.count > 1{
        var tempArr = nums
        let yushu = k % nums.count
        if yushu == 0{
            return
        }
        let end = nums.count - 1
        let subStart = end - yushu + 1
        let subArr = tempArr[subStart...end]
        tempArr.removeSubrange(subStart...end)
        tempArr.insert(contentsOf: subArr, at: 0)
        print(tempArr)

    }
    
}
