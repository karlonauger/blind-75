from typing import List


class Solution:
    def canJump(self, nums: List[int]) -> bool:
        n = len(nums)
        farthest = 0

        for i in range(n):
            # Fail if index is greater than farthest reachable point
            if i > farthest:
                return False
            # Update the farthest reachable point
            farthest = max(farthest, i + nums[i])
            # Succeed if we've reached or exceeded the last index
            if farthest >= n - 1:
                return True

        return False  # redundent
