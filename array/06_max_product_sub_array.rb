# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  # Initialize max_product, min_product, and global_max with the first element.
  max_product = min_product = global_max = nums[0]

  # Start from the second element since the first is already used to initialize the variables.
  nums[1..].each do |num|
    # If num is negative, swapping max and min because multiplying by a negative number
    # makes the small number larger and the large number smaller.
    if num < 0
      max_product, min_product = min_product, max_product
    end

    # max_product and min_product are updated by considering the current number alone
    # or its product with the previous max_product or min_product.
    max_product = [num, num * max_product].max
    min_product = [num, num * min_product].min

    # Update global_max if the current max_product is greater than global_max.
    global_max = [global_max, max_product].max
  end

  global_max
end