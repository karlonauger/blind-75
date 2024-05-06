import math


# Number of paths=(m+n−2/m−1) = (m+n−2)! / (m−1)!(n−1)!
class Solution:
    def uniquePaths_combinatorial(self, m: int, n: int) -> int:
        # Using the combinatorial approach
        return math.comb(m + n - 2, m - 1)

    def uniquePaths(self, m: int, n: int) -> int:
        # Using the dynamic programming approach
        dp = [[1] * n for _ in range(m)]

        for i in range(1, m):
            for j in range(1, n):
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]

        return dp[m - 1][n - 1]
