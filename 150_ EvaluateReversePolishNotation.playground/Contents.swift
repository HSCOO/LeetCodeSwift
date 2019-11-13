
/// 思路
///  遇到数字保存，遇到符号取出两个数字运算

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack:[Int] = []
        for item in tokens {
            switch item {
            case "+":
                if let stackLastTwo = stackLastTwo(stack: &stack) {
                    let result = stackLastTwo.0 + stackLastTwo.1
                    stack.append(result)
                }
                break
            case "-":
                if let stackLastTwo = stackLastTwo(stack: &stack) {
                    let result = stackLastTwo.0 - stackLastTwo.1
                    stack.append(result)
                }
                break
            case "*":
                if let stackLastTwo = stackLastTwo(stack: &stack) {
                    let result = stackLastTwo.0 * stackLastTwo.1
                    stack.append(result)
                }
                break
            case "/":
                if let stackLastTwo = stackLastTwo(stack: &stack) {
                    let result = stackLastTwo.0 / stackLastTwo.1
                    stack.append(result)
                }
                break
            default:
                if let itemInt = Int(item) {
                    stack.append(itemInt)
                }
                break
            }
        }
        let result = stack.popLast()!
        return result
    }

    func stackLastTwo( stack:inout [Int]) -> (Int, Int)? {
        if stack.count >= 2 {
            let second = stack.popLast()!
            let frist = stack.popLast()!
            return (frist, second)
        }
        return nil
    }
}

let so = Solution()
so.evalRPN(["2", "1", "+", "3", "*"])
so.evalRPN(["4", "13", "5", "/", "+"])
so.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])

