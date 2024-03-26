# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  left = 0 # Start with the leftmost line
  right = height.length - 1 # Start with the rightmost line
  max_water = 0 # To keep track of the maximum water so far
  
  while left < right
      # Calculate the current area
      current_height = [height[left], height[right]].min
      current_width = right - left
      current_water = current_height * current_width
      
      # Update max_water if the current area is larger
      max_water = [max_water, current_water].max
      
      # Move the pointers
      if height[left] < height[right]
          left += 1 # Move left pointer rightward
      else
          right -= 1 # Move right pointer leftward
      end
  end
  
  max_water
end
