# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  # O(n) Breadth first search
  return [] if root.nil?

  queue = [root]
  result = []
  
  while !queue.empty?
    current = queue.shift
    
    result << current.val
    
    queue << current.right unless current.right.nil?
    queue << current.left unless current.left.nil?
  end

  result
end
