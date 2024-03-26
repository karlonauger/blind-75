# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  # Create a set from nums for O(1) lookups
  num_set = nums.to_set

  longest_streak = 0

  num_set.each do |num|
    # Only start counting if 'num' is the start of a sequence
    if !num_set.include?(num - 1)
      current_num = num
      current_streak = 1

      # Continue until the next consecutive number is not found
      while num_set.include?(current_num + 1)
        current_num += 1
        current_streak += 1
      end

      # Update longest streak if the current streak is longer
      longest_streak = [longest_streak, current_streak].max
    end
  end

  longest_streak
end
