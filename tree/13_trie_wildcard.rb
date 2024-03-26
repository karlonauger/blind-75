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
    def add_word(word)
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
        nodes = [@root]
        word.each_char do |char|
            if char == "."
                nodes = nodes.flat_map{ |node| node.children.values }
            else
                nodes = nodes.flat_map do |node|
                    node.children[char] if node.children[char]
                end.compact
                return false if nodes.empty?
            end
        end

        nodes.any?(&:is_end_of_word)
    end
end

class WordDictionary
  def initialize()
    @trie = Trie.new
    @cache = {}
  end

  def add_word(word)
    @trie.add_word(word)
    @cache = {}
  end

  def search(word)
    return @cache[word] unless @cache[word].nil?
    
    @cache[word] = @trie.search(word)
  end
end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
