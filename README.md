#LeetCodes

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