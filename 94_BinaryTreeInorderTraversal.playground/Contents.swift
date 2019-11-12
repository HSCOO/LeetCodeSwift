public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
    
    class func arraryToTree(arr: [Int?], index: Int) -> TreeNode? {
        var node:TreeNode? = nil
        var currentIndex = index
        if currentIndex < arr.count && arr[currentIndex] != -1 {
            if let item = arr[currentIndex] {
                node = TreeNode.init(item)
                currentIndex = currentIndex + 1
                node?.left = arraryToTree(arr: arr, index: currentIndex)
                currentIndex = currentIndex + 1
                node?.right = arraryToTree(arr: arr, index: currentIndex)
            }else{
                node = nil
            }
        }
        return node
    }
}


class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res:[Int] = []
        var stack: [TreeNode] = []
        var curr = root
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            curr = stack.popLast()
            res.append(curr!.val)
            curr = curr?.right
        }
        return res
    }
}

let so = Solution()
let node = TreeNode.arraryToTree(arr: [1,nil,2,3,6,9,0], index: 0)
so.inorderTraversal(node)

