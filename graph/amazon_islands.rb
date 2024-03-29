# Enter your code here. Read input from STDIN. Print output to STDOUT
# Load input into matrixes array of arrays
num_cases = gets.to_i
matrixes = Array.new(num_cases) { [] }
(0..num_cases - 1).each do |case_i|
    n = gets.to_i
    (0..n - 1).each do |i|
        matrixes[case_i] << gets.split(" ")
    end
end

# DFS to fill in visited cells
SEARCH_PATTERN = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]

def dfs_fill(matrix, r, c, n)
    return if r < 0 || r >= n || c < 0 || c >= n || matrix[r][c] != "1"
    
    matrix[r][c] = "#"
    SEARCH_PATTERN.each do |i, j|
        dfs_fill(matrix, r + i, c + j, n)
    end
end

# Search matrixes for sets. When found fill them in and increment count by one.
total_counts = []
matrixes.each do |matrix|
    n = matrix.size
    count = 0
    matrix.each_with_index do |row, r|
        row.each_with_index do |cell, c|
            if cell == "1"
                dfs_fill(matrix, r, c, n)
                count += 1
            end
        end
    end
    total_counts << count
end

puts total_counts
