
/// 解法1
/// 思路：
/// 先转数组，遍历数组
/// 找到`#`，就删除`#`，如果前面有元素就删除，没有就不用删除
/// 最后合成字符串，对比
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let sFinalString = deleteCharater(string: S)
        let tFinalStringl = deleteCharater(string: T)
        return sFinalString == tFinalStringl
    }

    func deleteCharater(string: String) -> String {
        var arr = string.map{String($0)}//字符串转数组
        for chr in arr{
            switch chr {
            case "#":
                let index = arr.firstIndex(of: chr)!//数组在改变，重新获取index
                arr.remove(at: index)//删除当前字符
                if index > 0 {
                    arr.remove(at: index - 1)//删除前一字符
                }
                break
            default:
                break
            }
        }
        let finalString = arr.joined()//数组转字符串
        return finalString
    }
}

let so = Solution()
so.backspaceCompare("a##c", "#a#c")



