//
//  最长回文子串.swift
//  suanfa
//
//  Created by Netban on 2019/12/5.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation
//给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
//
//示例 1：
//
//输入: "babad"
//输出: "bab"
//注意: "aba" 也是一个有效答案。
//示例 2：
//
//输入: "cbbd"
//输出: "bb"
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/longest-palindromic-substring
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

// 暴利破解法 分割字符串, 遍历所有子串,找出回文字符串中 最大的
func longestPalindrome(_ s: String) -> String {
    var max = (max:0,str:"")
    
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
    
    
    
    if s.count <= 1{
        
        return s
    }else{
        for i in 0 ..< (s.count - 1){
            for j in (i+1) ..< s.count{
                let start = s.index(s.startIndex, offsetBy: i)
                let end = s.index(s.startIndex, offsetBy: j)
                let tempStr:Substring = s[start ... end]
                let string = String(tempStr)
                if isPalindrome(string){
                    if max.max < string.count{
                        max.max = string.count
                        max.str = string
                    }
                }
            }
        }
        return max.str == "" ? String(s.first!) : max.str
    }
}


func longestPalindromes(_ s: String) -> String {
    if s.count < 1{
        return s
    }
    
    
    let smap = s.map {
        String($0)
    }
    let str = "#" + smap.joined(separator: "#") + "#"
    
    return ""
}
