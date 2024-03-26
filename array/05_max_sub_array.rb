# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  # O(n) Kadane's Algorithm
  total = 0
  max = -Float::INFINITY

  nums.each do |num|
    total += num
    max = total if total > max
    total = 0 if total < 0 
  end

  max
end
