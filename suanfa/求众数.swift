//
//  求众数.swift
//  suanfa
//
//  Created by Netban on 2019/11/21.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation


/// 暴力破解法
/// 时间复杂度 0(N^2)
/// 空间复杂度 0(1)
/// - Parameter nums: 遍历两边,就每个元素出现的个数 超过一半返回
func majorityElement(_ nums: [Int]) -> Int {
    let midCount = nums.count / 2
    for a in nums{
        var count = 0
        for b in nums{
            if a == b{
                count += 1
            }
        }
        
        if count > midCount {
            return a
        }
    }
    return -1
    
}


/// 排序
/// 中间的元素就是
/// - Parameter nums: 数组
func majorityElements(_ nums: [Int]) -> Int {
    let tempArr = nums.sorted()
    return tempArr[nums.count / 2]
}



/// 投票法
/// 积分
/// 根据众数的判断,需要大于总数的一半 将是众数的 + 1 不是众数的 -1 ,如果是众数,最后肯定 > 1
/// 注意 如果 分数成0 ,可以从下一个元素继续开始,
/// 比如[1,1,2,3,2,1,1],当执行到3 的时候 积分为 0 可以从 3 的下个数 2开始不影响,相当于分片
/// - Parameter nums: 数组
func majorBest(_ nums:[Int]) -> Int{
    var times = 0
    var result = nums[0]
    for (index,value) in nums.enumerated() {
        if value == result{
            times += 1
        }else{
            times -= 1
        }
        if times == 0 {
            result = nums[index + 1]
        }
    }
    return result
}
