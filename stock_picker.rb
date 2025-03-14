def stock_picker(stock_prices)
  buy_price = stock_prices[0] # The first price is assumed to be the initial buy price
  buy_day = 0                 # Index of the buy price
  max_profit = 0              # Maximum profit found so far
  best_days = [0, 0]          # Pair of days to buy and sell for max profit

  # Iterate over each price with its corresponding day index
  stock_prices.each_with_index do |price, day|
    # Update buy price and buy day if a lower price is found
    if price < buy_price
      buy_price = price
      buy_day = day
    end

    # Calculate potential profit from the current price and buy price
    potential_profit = price - buy_price

    # Update max profit and best days if the current profit is greater
    if potential_profit > max_profit
      max_profit = potential_profit
      best_days = [buy_day, day]
    end
  end

  # Return the best pair of days to maximize profit
  best_days
end
