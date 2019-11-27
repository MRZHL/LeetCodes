//
//  main.swift
//  suanfa
//
//  Created by Netban on 2019/11/21.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

print("Hello, World!")

// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
print(findOne([4,1,2,1,2]))

// 求众数
print(majorityElement([2,2,1,1,1,2,2]))


print(majorBest([2,2,1,1,1,2,2]))



print(merge([1,2,3],3,[2,5,6],3))

print("isPalindrome\(isPalindrome("A man, a plan, a canal: Panama"))")


print("乘积最大子序列\(maxProduce2([2,3,-2,4]))")



print("旋转数组\(rotate([1,2],0))")

print("存在重复元素\(containsDuplicate2([1,2,3,2]))")
var nums = [0,1,2,3,2]
print("移动 0\(moveZeroes2(&nums))")

