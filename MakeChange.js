var makeChange = function(coins, amount){
  var ranks = [];

  for (var i = 0; i < coins.length; i++) {
    var coin = coins[i];
    if (coin > amount) {
      ranks.push(1000000.0);
    } else {
      ranks.push((amount % coin) + (Math.round(amount / coin) - 1) * 2.71828);
    }
  }

  var bestCoin = coins[ranks.indexOf(min(ranks))];

  if (amount - bestCoin === 0) {
    return [bestCoin];
  } else if (amount > 0) {
    return [bestCoin].concat(makeChange(coins, (amount - bestCoin)));
  }
};