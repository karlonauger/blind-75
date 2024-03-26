class MedianFinder
  def initialize()
      @min_heap = Containers::MinHeap.new # Top half
      @max_heap = Containers::MaxHeap.new # Bottom half
  end

=begin
  :type num: Integer
  :rtype: Void
=end
  def add_num(num)
      if @max_heap.max.nil? || @max_heap.max > num
          @max_heap.push(num)
      else
          @min_heap.push(num)
      end

      if @max_heap.size < @min_heap.size
          @max_heap.push(@min_heap.pop)
      elsif @max_heap.size > @min_heap.size + 1
          @min_heap.push(@max_heap.pop)
      end
  end

=begin
  :rtype: Float
=end
  def find_median()
      if @max_heap.size == @min_heap.size
          (@max_heap.max + @min_heap.min) / 2.0
      else
          @max_heap.max
      end
  end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()
