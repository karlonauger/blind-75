from typing import List


class Solution:
    def simple_rob(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 0:
            return 0
        if n == 1:
            return nums[0]
        if n == 2:
            return max(nums)

        # Create a dynamic programming array
        dp = [0] * n  # create empty array of 0's length n
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in range(2, n):
            # dp[i]=max(dp[i−1],nums[i]+dp[i−2])
            dp[i] = max(dp[i-1], nums[i] + dp[i-2])

        return dp[-1]

    def rob(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 0:
            return 0
        if n == 1:
            return nums[0]
        if n == 2:
            return max(nums)

        return max(self.simple_rob(nums[:-1]), self.simple_rob(nums[1:]))
