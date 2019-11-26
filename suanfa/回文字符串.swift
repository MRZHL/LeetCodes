//
//  回文字符串.swift
//  suanfa
//
//  Created by Netban on 2019/11/21.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

/// 思路
/// 1 去除空格,2 变成小写 3 倒序
/// 注意, 只考虑字母和数字字符.给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
/// - Parameter s:比较的字符串
func isPalindrome(_ s: String) -> Bool {
    
    func judgeLetter(_ character:Character) ->Bool{
        if character >= "a" && character <= "z"{
            return true
        }
        if character >= "0" && character <= "9"{
            return true
        }
        return false
    }
    
    if s.count > 1 {
        let tempStr = s.lowercased()
        var temp = Array(tempStr).filter {
               judgeLetter($0)
           }
           let a = temp
           temp.reverse()
           return a == temp
    }else{
        return true
    }
}


