# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  # O(n)
  counts = {}
  nums.each do |num|
      if counts[num].nil?
          counts[num] = 1
      else
          counts[num] += 1
      end
  end
  # Above is equivalent to:
  # counts = nums.each_with_object(Hash.new(0)) { |num, count| count[num] += 1 }

  # O(m log m)
  sorted_nums_by_count = counts.sort_by { |num, count| [-count, num] }
  # O(k)
  sorted_nums_by_count.first(k).map(&:first)
end
