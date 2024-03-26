# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min = Float::INFINITY
  max = 0

  prices.each_with_index do |price, index|
      if price < min
          min = price
      end

      if price - min > max
          max = price - min
      end
  end
  
  max
end
