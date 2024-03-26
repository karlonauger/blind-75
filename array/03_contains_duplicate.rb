# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  hash = {}
  nums.each do |num|
      return true if hash[num]
      hash[num] = num
  end

  false
end
