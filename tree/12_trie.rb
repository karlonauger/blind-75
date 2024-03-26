class TrieNode
  attr_accessor :children, :is_end_of_word

  def initialize
    @children = {}
    @is_end_of_word = false
  end
end

class Trie
    def initialize()
        @root = TrieNode.new
    end

=begin
    :type word: String
    :rtype: Void
=end
    def insert(word)
        node = @root
        word.each_char do |char|
            node.children[char] ||= TrieNode.new
            node = node.children[char]
        end
        node.is_end_of_word = true
    end


=begin
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        node = @root
        word.each_char do |char|
            return false unless node.children[char]
            node = node.children[char]
        end
        node.is_end_of_word
    end


=begin
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        node = @root
        prefix.each_char do |char|
            return false unless node.children[char]
            node = node.children[char]
        end
        true
    end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
