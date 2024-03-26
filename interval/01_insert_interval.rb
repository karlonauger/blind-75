# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  # Prepare a list to hold the result
  result = []

  intervals.each do |interval|
    # If the current interval ends before the new one starts, add it to the result
    if interval.last < new_interval.first
      result << interval
    # If the current interval starts after the new one ends, add the new interval
    # to the result, then update the new interval to current one (effectively
    # shifting the new interval forward for further comparisons)
    elsif interval.first > new_interval.last
      result << new_interval
      new_interval = interval
    # If the current interval overlaps with the new interval, merge them
    else
      new_interval = [
        [new_interval.first, interval.first].min,
        [new_interval.last, interval.last].max
      ]
    end
  end

  # Don't forget to add the last interval
  result << new_interval

  result
end
