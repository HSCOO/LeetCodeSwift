public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
    // 层序遍历创建二叉树
    class func arraryToTree(arr: [Int?],len: Int, index: Int) -> TreeNode? {

        if index > len - 1 {
            return nil
        }
        print("index - \(index)")
        if let item = arr[index] {
            print("item \(item)")
            let node = TreeNode.init(item)
            node.left = arraryToTree(arr: arr, len: len, index: index + 1)
            node.right = arraryToTree(arr: arr, len: len, index: index + 2)
            return node
        }else{
            return nil
        }
    }

    class func printNode(node: TreeNode?) {
        if node == nil {
            return
        }
        print("\(node!.val)")
        printNode(node: node!.left)
        printNode(node: node!.right)
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
let arr = [1,nil,9,2,3]
let node = TreeNode.arraryToTree(arr: arr,len: arr.count,index: 0)
TreeNode.printNode(node: node)

so.inorderTraversal(node)

