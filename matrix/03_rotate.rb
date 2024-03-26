# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  n = matrix.length
  # The layer count is n / 2
  (0...n/2).each do |layer|
    first = layer
    last = n - 1 - layer
    (first...last).each do |i|
      offset = i - first
      top = matrix[first][i] # save top
      
      # left -> top
      matrix[first][i] = matrix[last-offset][first]
      
      # bottom -> left
      matrix[last-offset][first] = matrix[last][last-offset]
      
      # right -> bottom
      matrix[last][last-offset] = matrix[i][last]
      
      # top -> right
      matrix[i][last] = top # right <- saved top
    end
  end
  matrix
end
