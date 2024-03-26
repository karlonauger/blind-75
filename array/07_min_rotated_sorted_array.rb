# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  # O(log n) Basically a binary search in a sorted array
  low = 0
  high = nums.size - 1

  while low < high
    mid = (low + high) / 2
    # If the element at mid is greater than the element at high, 
    # the smallest value must be in the right half.
    if nums[mid] > nums[high]
      low = mid + 1
    else
      # Else, the smallest value is in the left half including mid.
      high = mid
    end
  end

  nums[low]
end
