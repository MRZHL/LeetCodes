//
//  合并两个有序数组.swift
//  suanfa
//
//  Created by Netban on 2019/11/21.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

func merge(_ nums1:[Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var tempArr = [Int]()
    var i = 0
    var j = 0
    while i < m && j < n  {
        if nums1[i] < nums2[j] {
            tempArr.append(nums1[i])
            i += 1
        }else{
            tempArr.append(nums2[j])
            j += 1
        }
    }
    
    while i < m {
        tempArr.append(nums1[i])
        i += 1
    }
    while j < n {
        tempArr.append(nums2[j])
        j += 1
    }
    
    print(tempArr)

}

