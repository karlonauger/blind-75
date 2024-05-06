
# Memory issue: should instead count and not calculate possibilities
class Solution:
    def numDecodings(self, s: str) -> int:
        if not s:
            return 0
        if s[0] == '0':  # No valid encoding starts with '0'
            return 0

        # Map from numbers to letters
        num_to_char = {str(i): chr(64 + i) for i in range(1, 27)}

        # Memoization dictionary to store results for substrings
        memo = {}

        def decode(index):
            if index == len(s):
                return [""]  # End condition
            if s[index] == '0':
                return []  # No valid decodings for '0'
            if index in memo:
                return memo[index]

            result = []

            # Take one character
            if index < len(s) and s[index:index+1] in num_to_char:
                for suffix in decode(index + 1):
                    result.append(num_to_char[s[index:index+1]] + suffix)

            # Take two characters
            if index + 1 < len(s) and s[index:index+2] in num_to_char:
                for suffix in decode(index + 2):
                    result.append(num_to_char[s[index:index+2]] + suffix)

            memo[index] = result
            return result

        # Start decoding from index 0
        return len(decode(0))
