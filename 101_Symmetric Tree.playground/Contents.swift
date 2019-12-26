
// 二叉树定义
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

// 二叉树创建
class TreeManager{
    var root: TreeNode?

    fileprivate var items: Array<Int?>
    fileprivate var index = -1

    init(_ items: Array<Int?>) {
        self.items = items
        self.root = self.createTree()
    }

    fileprivate func createTree() -> TreeNode?{
        self.index += 1
        if index < self.items.count && index >= 0 {
            let item = self.items[index]
            if item != nil {
                let root = TreeNode.init(item!)
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

//class Solution {
//
//    var resArr:[Int?] = []
//
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        allTree(tree: root)
//        while resArr.last! == nil {
//            resArr.popLast()
//        }
//        print(resArr)
//        return (resArr.count == 1) // 其他的都配对成功
//    }
//
//    func allTree(tree: TreeNode?){
//        if resArr.isEmpty {
//            resArr.append(tree?.val)
//        }else{
//            if resArr.last! == tree?.val {
//                resArr.popLast()
//            }else{
//                resArr.append(tree?.val)
//            }
//        }
//
//        if tree?.left != nil {
//            allTree(tree: tree?.left)
//        }else{
//            if tree?.right != nil {
//                resArr.append(nil)
//            }
//        }
//
//        if tree?.right != nil {
//            allTree(tree: tree?.right)
//        }else{
//            if tree?.left != nil {
//                resArr.append(nil)
//            }
//        }
//    }
//}
//
//let so = Solution()
//let root = TreeManager.init([1,2,2,3,4,4,3]).root
////let root = TreeManager.init([1,2,2,nil,3,nil,3]).root
//so.isSymmetric(root)

class Solution {

    func isSymmetric(tree: TreeNode?) -> Bool {
        return isMirror(tree1: tree, tree2: tree)
    }

    func isMirror(tree1: TreeNode?, tree2: TreeNode?) -> Bool {
        if tree1 == nil && tree2 == nil {
            return true
        }
        if tree1 == nil || tree2 == nil {
            return false
        }
        return tree1!.val == tree2!.val
            && isMirror(tree1: tree1!.left, tree2: tree2!.right)
            && isMirror(tree1: tree1!.right, tree2: tree2!.left)
    }
}

let so = Solution()
let root = TreeManager.init([1,2,2,3,4,4,3]).root
//let root = TreeManager.init([1,2,2,nil,3,nil,3]).root
so.isSymmetric(tree: root)
