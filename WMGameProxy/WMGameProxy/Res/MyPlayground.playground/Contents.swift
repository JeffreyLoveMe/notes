/**
 冒泡排序
 1>.原理 - 相邻元素两两比较->将较大的数字交换到右边
 2>.时间复杂度 - O(N^2)
 3>.空间复杂度 - O(1)
 4>.稳定性 - 稳定
 */
var array:[Int] = [4, 8, 7, 2, 6]
func bubbleSort(array: inout [Int]) -> [Int] {
    // 需要排序 (array.count - 1) 轮
    for i in 0..<(array.count - 1) {
        // 需要比较 (array.count - i - 1) 次数
        for j in 0..<(array.count - i - 1) {
            // 交换前后位置
            if array[j] > array[j+1] {
                let temp = array[j+1]
                array[j+1] = array[j]
                array[j] = temp
            }
        }
    }
    return array
}
//bubbleSort(array: &array)


/**
 选择排序
 1>.原理 - 从 0 开始默认第 i 位数字最小->依次比较第 i 位以后元素大小找到最小值交换到第 i 位
 2>.时间复杂度 -
 3>.空间复杂度 -
 4>.稳定性 -
 */
func selectedSort(array: inout [Int]) -> [Int] {
    // 需要排序 (array.count - 1) 轮
    for i in 0..<(array.count - 1) {
        // 保存最小值的位置，默认为 i
        var min = i
        // 从 (i + 1) 开始遍历找到真正最小值的位置
        for j in (i + 1)..<array.count {
            if array[j] < array[min] {
                min = j
            }
        }
        // 最小值交换到第 i 位
        if  min != i {
            let temp = array[i]
            array[i] = array[min]
            array[min] = temp
        }
    }
    return array
}
//selectedSort(array: &array)


/**
快速排序
1>.原理 - xxx
2>.时间复杂度 -
3>.空间复杂度 -
4>.稳定性 -
*/


/**
 二分查找
 1>.原理 -
 2>.时间复杂度 -
 3>.空间复杂度 -
 4>.稳定性 -
 */
func getKey(array: [Int], key: Int, low: Int, high: Int) -> Int {
    if low > high {
        return  -1
    }
    let mid: Int = (low + high) / 2
    if key == array[mid] {
        return mid
    } else if key < array[mid] {
        return getKey(array: array, key: key, low: low, high: mid - 1)
    } else {
        return getKey(array: array, key: key, low: mid + 1, high: high)
    }
}
getKey(array: array, key: 8, low: 0, high: array.count - 1)
