//
//  onlyOne.swift
//  suanfa
//
//  Created by Netban on 2019/11/21.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

func findOne(_ arr:[Int]) ->Int?{
    let a = Set(arr)
    var sumA = 0
    var sumB = 0
    for value in a {
        sumA += value
    }
    
    for temp in arr {
        sumB += temp
    }
    
    return sumA * 2 - sumB
}
