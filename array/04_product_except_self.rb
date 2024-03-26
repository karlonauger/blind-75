# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  # O(n)
  products = [1]
  running_product = 1
  
  nums[0..-2].each_with_index do |num, index|
    running_product *= num
    products << running_product
  end

  running_product = 1
  (nums.size - 1).downto(0) do |index|
    products[index] *= running_product
    running_product *= nums[index]
  end

  return products
  
  # O(n^2)
  nums.each_with_index.map do |num, index|
    (nums[0...index] + nums[index+1..-1]).inject(:*)
  end
end
