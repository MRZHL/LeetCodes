# LeetCodes

## 2019-12-09
盛水最多的容器
//给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水
//
//来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/container-with-most-water

方法直接暴力法
两次遍历,提交的时候直接超出了时间限制

```
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
```

双指针法

```
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
```

## 2019-12-05
### 回文数
方法一， 最容易想到的，将Int -> String -> Array -> reverse() -> Int
判断是否相等就可以

```
func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else {
        return false
    }
    let s = String(x)
    var temp = Array(s)
    temp.reverse()
    let y = Int(String(temp))
    return y == x
}
```
执行结果//执行用时 :88 ms, 在所有 swift 提交中击败了10.67%的用户，内存消耗 :20.9 MB, 在所有 swift 提交中击败了5.03%的用户。

方法二 ，看这个数的一半和另外一半是否相等
将这个数主键 除以 10 ，结果是这个数 缩小十倍，余数是 个位数 -> 十位数 -> 百位数 。。。。

```

/// 思路 让 x 每次缩小十倍 12321 -> 1232 -> 123 -> 12
///     让 temp 每次扩大十倍 + x 的余数 ,余数就是从个位数 开始,每次缩小十倍的数, 当着两个数 想等的时候,就是回文数(偶数),或者 temp / 10 = x 的时候(奇数)就是回文数
/// - Parameter x:
func isPalindromes(_ x: Int) -> Bool {
    // < 0 和能被整除的
    
    if x < 0 || (x % 10 == 0 && x != 0){
        return false
    }
    
    var end = 0
    var compare = x
    
    while compare > end {
        end = end * 10 + compare % 10
        compare = compare / 10
    }
    
    return compare == end || compare == end / 10
}
```

## 2019-12-04
###  寻找两个有序数组的中位数
给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。
示例 1:

```
nums1 = [1, 3]
nums2 = [2]

则中位数是 2.0
```

示例 2:

```
nums1 = [1, 2]
nums2 = [3, 4]

则中位数是 (2 + 3)/2 = 2.5
```

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

思路，合并有序数组，然后找出新数组中的中位数，个数为奇数的为 count / 2 位置上的 数 偶数的为 count / 2 + count / 2 - 1 位置上的数的平均数.

中间想优化的时候，排序的时候 只拍到一半就可以求中位数了，但是结果耗时更多


```
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    func paixu(_ num1:[Int],_ num2:[Int]) -> [Int]{
        var result = [Int]()
        var i = 0
        var j = 0
        while i < num1.count && j < num2.count {
            if num1[i] < num2[j] {
                result.append(num1[i])
                i += 1
            }else{
                result.append(num2[j])
                j += 1
            }
        }
        
        while i < num1.count {
            result.append(num1[i])
            i += 1
        }
        
        while j < num2.count {
            result.append(num2[j])
            j += 1
        }
        return result
    }
    
    let temp = paixu(nums1, nums2)
    guard temp.count > 1 else {
        return Double(temp[0])
    }
    if temp.count % 2 == 0{
        return Double((temp[temp.count/2] + temp[temp.count/2 - 1])) / 2.0
    }else{
        return Double(temp[temp.count/2])
    }
}


```
## 2019-12-03
### 两数相加
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
示例：

```
输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
```

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/add-two-numbers
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### 个人解法
这里要注意  temp 和  rootNode 刚开始他俩是相等的 在 第一次 `temp = temp.next! ` 其实是 temp = rootNode.next 此时 temp 为  rootNode 的下一个节点，依次往后

```
/// 思路 模拟正常的数学 家法, 记得要向前 进 1位, 和 对应位数 相加 大于10 的情况
/// - Parameter l1: 链1
/// - Parameter l2: 链2
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let rootNode = ListNode(0)
    var nodeOne = l1
    var nodeTwo = l2
    var temp = rootNode
    var max10 = 0
    while (nodeOne != nil || nodeTwo != nil){
        let one = nodeOne?.val
        let two = nodeTwo?.val
        
        let sum:Int = (one ?? 0) + (two ?? 0) + max10
        let current = sum % 10  // 余数作为当前值
        max10 = sum / 10  //结果是否向前 + 1
        temp.next = ListNode(current)
        nodeOne = nodeOne?.next
        nodeTwo = nodeTwo?.next
        temp = temp.next!
        
    }
    // 此时要判断, 是否最后相加要向前进 1
    if max10 > 0 {
        temp.next = ListNode(1)
    }
    return rootNode.next
}

```

### 大神牛逼的递归算法
退出条件 
当 l1为 nil 直接返回 l2 相当于 a + 0 = a
当 l2为 nil 直接返回 l1

```
func addTwoNumberss(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else { return l2 }
    guard let l2 = l2 else { return l1 }
    
    let node = ListNode(0)
    node.val = (l1.val + l2.val) % 10
    if l1.val + l2.val > 9 {
        node.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next), ListNode(1))
    } else {
        node.next = addTwoNumbers(l1.next, l2.next)
    }
    return node
}

```

## 2019-12-02
### 整数反转

想法, 将Int -> String -> reverse -> Int
再根据输入的值确定符号, 判断是否在区间内

```
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

```

最后执行的结果
执行用时 :8 ms, 在所有 swift 提交中击败了85.86%的用户
内存消耗 :20.9 MB, 在所有 swift 提交中击败了5.19%的用户

值得注意的 地方刚开始的时候 使用 `pow(2,31)` 返回的是一个 `Decimal` 的对象 
使用的方法在Foundtion 里
```
public func pow(_ x: Decimal, _ y: Int) -> Decimal
```
不能通过 Int() 来直接转换为 Int 对象
后来使用的方法是
```
public func pow(_: Double, _: Double) -> Double
```
就好使了



## 2019-11-29
### 两数之和
直接暴力破解法

```
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< (nums.count - 1){
        for j in (i + 1) ... (nums.count - 1){
            if nums[i] + nums[j] == target {
                return [i,j]
            }
        }
    }
    return []
}
```
最后的执行结果是
> 执行用时 :604 ms, 在所有 swift 提交中击败了 25.61%的用户,内存消耗 :21 MB, 在所有 swift 提交中击败了5.12%的用户

看了一下大佬们的想法，是 遍历一次，把之前的遍历过的值装进一个 字典里，key 是 值， value 是下标，所以可以根据 target - currentValue 当作key 直接去取 index ,取到值就返回，没有取到就存到字典里

```
func twoSums(_ nums: [Int], _ target: Int) -> [Int] {
    var dic = [Int:Int]()
    for (index,value) in nums.enumerated(){
        let subValue = target - value
        if let otherIndex = dic[subValue]{
            return [otherIndex,index]
        }
        dic[value] = index
    }
    return []
}
```


## 2019-11-28
### 打乱数组，这个比较简单
思路，找一个数组 存储原始数组，
遍历数组， 随机产生一个 0 ..< count 的 下标
交换 遍历的当前述 和 随机下标对应的数 


```
class Solution {
    var originArr:[Int]
    var nums:[Int]
    let count:Int
    init(_ nums: [Int]) {
        self.originArr = nums
        self.nums = nums
        count = nums.count
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return originArr
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        for index in 0 ..< count {
           
            let randomIndex = Int.random(in: 0 ..< count)
            print(randomIndex)
            // 交互两个数
            let temp = nums[index]
            nums[index] = nums[randomIndex]
            nums[randomIndex] = temp
        }
         return nums
    }
}

```


## 2019-11-27
### 给定一个数组，是否存在重复数组 

// 最简单的方法 存入 Set 中，比较个数

```
func containsDuplicate(_ nums: [Int]) -> Bool {

    let set = Set(nums)
    let result = set.count == nums.count
    return !result
}

```
排序比较 相邻的元素是否相等

```
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
```

### 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
方法一 

```
/// 思路是 找到第一个 0 和费零数交换位置
/// 外层遍历到 0 的元素
/// 内存遍历到不是 0 的元素 交换位置
/// - Parameter nums: 数组
func moveZeroes(_ nums: inout [Int]) {
    for i in 0 ..< (nums.count-1){
        if nums[i] == 0 {
            for j in (i+1) ..< nums.count{
               if nums[j] != 0 {
                   let temp = nums[j]
                    nums[j] = nums[i]
                    nums[i] = temp
                break
               }
            }
        }
    }
    
    print("移动0\(nums)")
}

```

方法二

```
/// 用时比较少的一种解法
/// 先循环一遍 把 不是 0 的元素 都提到最前面
/// 根据 最后不是 0 的坐标 后面都设置成 0
/// [0,1,0,3,12]
/// i = 0
/// i = 1 [1,1,0,3,12] lastNotZeroAtIndex = 1
/// i = 2
/// i = 3 [1,3,0,3,12] lastNotZeroAtIndex = 2
/// i = 4 [1,3,12,3,12] lastNotZeroAtIndex = 3
/// 最后 将 lastNotZeroAtIndex 后面的数 全部 补 0
/// [1,3,12,0,0]
/// - Parameter nums: 数组
func moveZeroes2(_ nums: inout [Int]) {
    var lastNotZeroAtIndex = 0
    for i in 0 ... (nums.count - 1){
        if nums[i] != 0 {
            nums[lastNotZeroAtIndex] = nums[i]
            lastNotZeroAtIndex += 1
        }
    }
    
    var j = lastNotZeroAtIndex
    while j < nums.count {
        nums[j] = 0
        j += 1
    }
    
    print("移动0\(nums)")
}

```

##  2019-11-25
给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

```
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
```
