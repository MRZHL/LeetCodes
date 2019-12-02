//
//  整数反转.swift
//  suanfa
//
//  Created by Netban on 2019/12/2.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation


//MARK: 题目 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转


//MARK:结果
//执行用时 :
//8 ms
//, 在所有 swift 提交中击败了
//85.86%
//的用户
//内存消耗 :
//20.9 MB
//, 在所有 swift 提交中击败了
//5.19%
//的用户





/// 思路 转变成字符串, 换位置以后,再转成Int, 最后判断有没有超过 限制
/// - Parameter x: 整数
func reverse(_ x: Int) -> Int {
    
    func rever(_ x:Int)->String{
        let str = String(x)
        var arr = Array(str)
        arr.reverse()
        let temp = String(arr)
        return temp
    }
    
    var value = 0

    if x > 0 {
        value = Int(rever(x))!
    }else if x < 0{
        var temp:String = rever(x)
        temp.removeLast()
        value = Int(temp)! * -1
    }
    let max = pow(2.0, 31.0) - 1
    let min = pow(2.0, 31.0) * -1
    if value >= Int(max) || value <= Int(min){
        value = 0
    }
    return value
    
}
