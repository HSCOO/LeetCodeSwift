
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


/// 解法2
/// 思路：
/// 遇到数字就进栈，遇到`#`就出栈
/// 最后出栈对比是否相同
class Solution2{
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var stackS = checkCharacter(string: S)
        var stackT = checkCharacter(string: T)
        
        if stackS.count != stackT.count {//如果大小不同，肯定不同
            return false
        }
        
        while stackS.count != 0 { // 取出栈里的每个元素做对比，直到所有的元素都取出来
            if !stackT.isEmpty && !stackS.isEmpty && stackS.popLast() != stackT.popLast() {
                return false
            }
        }
        
        return true
    }
    
    func checkCharacter(string: String) -> [Character] {
        var stack: [Character] = []
        for char in string {
            if char == "#" && !stack.isEmpty {//栈有元素时，遇到`#`就出栈
                stack.popLast()
            }else if (char != "#"){ //遇到数字，就进栈
                stack.append(char)
            }
        }
        return stack
    }
}

let so2 = Solution2()
so2.backspaceCompare("a##c", "#a#ccc")


