class Solution {
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var stack:[Int] = []
        var res:[Int] = Array.init(repeating: 0, count: n)
        var logChars = logs.first?.split(separator: ":")
        var funcNum = String((logChars?.first)!)
        var timeNum = String((logChars?.last)!)

        stack.append(Int(funcNum)!)
        var i = 1
        var prev = Int(timeNum)!
        while i < logs.count {
            logChars = logs[i].split(separator: ":")
            funcNum = String((logChars?.first)!)
            timeNum = String((logChars?.last)!)

            if logChars![1] == "start" {
                if !stack.isEmpty {
                    res[stack.last!] += Int(timeNum)! - prev
                }
                stack.append(Int(funcNum)!)
                prev = Int(timeNum)!
            }else{
                res[stack.last!] += Int(timeNum)! - prev + 1
                stack.popLast()
                prev = Int(timeNum)! + 1
            }
            i += 1
        }
        return res
    }
}

let so = Solution()
so.exclusiveTime(2, ["0:start:0",
"1:start:2",
"1:end:5",
"0:end:6"])

