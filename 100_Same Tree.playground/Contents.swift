import Foundation
//  Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
    }
}

class TreeManager{
    var root: TreeNode?

    fileprivate var items: Array<Any>
    fileprivate var index = -1

    init(_ items: Array<Any>) {
        self.items = items
        self.root = self.createTree()
    }

    fileprivate func createTree() -> TreeNode?{
        self.index += 1
        if index < self.items.count && index >= 0 {
            let item = self.items[index]
            if item is Int {
                let root = TreeNode.init(item as! Int)
                root.left = createTree()
                root.right = createTree()
                return root
            }else{
                return nil
            }
        }
        return nil
    }
}




class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }

        if p?.val != q?.val {
            return false
        }

        return isSameTree(p?.left, q?.left) &&
               isSameTree(p?.right, q?.right)
    }
}


let so = Solution()

let oneNode = TreeManager.init([1,2]).root
let twoNode = TreeManager.init([1,nil,2]).root

so.isSameTree(oneNode, twoNode)
