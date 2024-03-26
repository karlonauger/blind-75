# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  # O(n)
  hash = {}
  nums.each_with_index do |num, index|
      complement = target - num
      if hash.key?(complement)
          return [hash[complement], index]
      end
      hash[num] = index
  end

  # O(n^2)
  nums.each_with_index do |num, index|
      nums[index + 1..-1].each_with_index do |num_2, index_2|
          if num + num_2 == target
              return [index, index + index_2 + 1]
          end
      end
  end
end
