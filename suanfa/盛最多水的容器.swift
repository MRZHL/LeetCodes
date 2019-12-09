//
//  盛最多水的容器.swift
//  suanfa
//
//  Created by Netban on 2019/12/9.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
//给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/container-with-most-water
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

// 有最基础的暴利破解法
// 超出时间限制
func maxArea(_ height: [Int]) -> Int {
    var max = 0
    for i in 0 ..< (height.count - 1){
        for j in 1...(height.count - 1){
            let y = min(height[i], height[j])
            max = max > (y * (j - i)) ? max : (y * (j - i))
        }
    }
    return max
}


// 双指针法
// [1,8,6,2,5,4,8,3,7]
// 面积是 两个数的最小值 * 宽度
func maxAreas(_ height: [Int]) -> Int{
    var before = 0
    var after = height.count - 1
    var max = 0
    
    while before < after {
        let area = min(height[after], height[before]) * (after - before)
        max = max > area ? max : area
        if height[after] > height[before] {
            before += 1
        }else if height[after] < height[before] {
            after -= 1
        }else{
            before += 1
            after -= 1
        }
    }
    
    return max
}
