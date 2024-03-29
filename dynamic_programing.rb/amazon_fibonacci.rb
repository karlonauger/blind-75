# Enter your code here. Read input from STDIN. Print output to STDOUT
def gcd(a, b)
  # Euclidean algorithm to find the greatest common divisor (GCD)
  b == 0 ? a : gcd(b, a % b)
end

def find_fibonacci_factor(k)
    fib_0, fib_1 = 0, 1
    while true
        fib_0, fib_1 = fib_1, fib_0 + fib_1
        d = gcd(fib_1, k)
        return [fib_1, d] if d > 1
    end
end

num_cases = gets.to_i
num_cases.times do 
    k = gets.to_i
    puts find_fibonacci_factor(k).join(" ")
end
