class TrieNode
  attr_accessor :children, :word

  def initialize
    @children = {}
    @word = nil  # Store full word at leaf node for easy retrieval
  end
end

def build_trie(words)
  root = TrieNode.new
  words.each do |word|
    node = root
    word.chars.each do |char|
      node.children[char] ||= TrieNode.new
      node = node.children[char]
    end
    node.word = word  # Mark the end of a word and store it
  end
  root
end

def dfs(board, node, i, j, result)
  return if i < 0 || i >= board.size || j < 0 || j >= board[0].size  # Out of bounds
  char = board[i][j]
  return if char == "#" || node.children[char].nil? # Already visited or no path in trie

  node = node.children[char]
  if node.word  # Found a word
    result << node.word
    node.word = nil  # Avoid duplicate entries
  end

  # Temporarily mark the board cell as visited
  board[i][j] = "#"
  dfs(board, node, i + 1, j, result)  # Down
  dfs(board, node, i - 1, j, result)  # Up
  dfs(board, node, i, j + 1, result)  # Right
  dfs(board, node, i, j - 1, result)  # Left

  # Restore the board cell
  board[i][j] = char
end

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  root = build_trie(words)
  result = []

  board.each_with_index do |row, i|
    row.each_with_index do |_, j|
      dfs(board, root, i, j, result)
    end
  end

  result
end

# TLE Error :(
