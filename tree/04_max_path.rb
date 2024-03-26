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
# @return {Integer}
def max_branch_and_total(root)
  return [-Float::INFINITY, -Float::INFINITY] if root.nil?
  left = max_branch_and_total(root.left)
  right = max_branch_and_total(root.right)

  max_branch = [
      root.val,
      root.val + left.first,
      root.val + right.first,
  ].max

  max_total = [
      max_branch,
      root.val + right.first + left.first,
      left.last,
      right.last
  ].max

  [max_branch, max_total]
end

def max_path_sum(root)
  max_branch_and_total(root).last
end
