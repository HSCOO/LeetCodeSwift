class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack:[Int] = []
        for item in asteroids {
            stackAppend(stack: &stack, item: item)
        }
        return stack
    }

    func stackAppend(stack:inout [Int], item: Int){
        if stack.isEmpty {
            stack.append(item)
        }else{
            if stack.last! * item > 0 {//说明时相同方向，入栈
                stack.append(item)
            }else{//方向不同，并且要保证负数在右，正数在左才可以碰撞

                if item < 0 {//负数在右
                    if stack.last! + item == 0{
                        stack.popLast()
                    }else{//方向不同，并且不相等
                        if abs(stack.last!) < abs(item){
                            stack.popLast()
                            self.stackAppend(stack: &stack, item: item)
                        }
                    }
                }else{
                    stack.append(item)
                }
            }
        }
    }
}

let so = Solution()
so.asteroidCollision([5, 10, -5])
so.asteroidCollision([8, -8])
so.asteroidCollision([10, 2, -5])
so.asteroidCollision([-2,-1,1,2])//
