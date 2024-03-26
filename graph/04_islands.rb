def dfs_fill(grid, i, j)
  return if i < 0 || i >= grid.size || j < 0 || j >= grid[0].size  # Out of bounds
  cell = grid[i][j]
  return if cell == "#" || cell == "0" # Already visited or watter

  # Mark the board cell as visited
  grid[i][j] = "#"
  dfs_fill(grid, i + 1, j)  # Down
  dfs_fill(grid, i - 1, j)  # Up
  dfs_fill(grid, i, j + 1)  # Right
  dfs_fill(grid, i, j - 1)  # Left
end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    count = 0
    grid.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            if cell == "1"
                dfs_fill(grid, i, j) 
                count += 1
            end
        end
    end
    count
end
