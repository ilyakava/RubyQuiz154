def make_change(target,coins,used_coins=[])
  unless target < 1
    rankings = coins.map do |coin|
      coin > target ? (coin * target) : (target % coin) + (target/coin) * 2.71828
    end

    best_coin_index = rankings.index(rankings.min)
    used_coins<<coins[best_coin_index]
    target -= coins[best_coin_index]

    make_change(target,coins,used_coins)
  else
    if target == 0
      used_coins
    else
      nil
    end
  end
end