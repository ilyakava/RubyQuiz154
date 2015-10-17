# Dynamic programming implementation. Returns subproblem_cache and used_coins each time
def make_change(target, coins, used_coins = [], subproblem_cache)
  throw "Target and coins must all be integers" unless target.class == Fixnum && coins.map { |c| c.class }.uniq == [Fixnum]
  # Base cases
  if target == 0
    { used_coins: used_coins, subproblem_cache: subproblem_cache }
  elsif coins.include?(target)
    { used_coins: used_coins + [target], subproblem_cache: subproblem_cache }
  elsif subproblem_cache.include?(target)
    { used_coins: used_coins + subproblem_cache[target], subproblem_cache: subproblem_cache }
  elsif target < coins.min
    return nil # no solution
  else
    # The best solution can be found by considering all possible divisions of the coins into two groups
    best_used_coins = nil
    (1..(target / 2)).each do |first_target|
      second_target = target - first_target
      first_soln = make_change(first_target, coins, used_coins, subproblem_cache)
      secnd_soln = make_change(second_target, coins, used_coins, subproblem_cache)
      next if first_soln.nil? || secnd_soln.nil?
      these_used_coins = first_soln[:used_coins] + secnd_soln[:used_coins]
      best_used_coins = these_used_coins if best_used_coins.nil? || these_used_coins.size < best_used_coins.size
    end
    if best_used_coins.nil? # there was no solution for any of the possible divisions
      nil
    else
      subproblem_cache[target] = best_used_coins
      { used_coins: best_used_coins + used_coins, subproblem_cache: subproblem_cache }
    end
  end
end

# Wrapper around function above to return hash of coins to counts
def best_change(target, coins)
  solution = make_change(target, coins, [], {})
  if solution.nil?
    "No solution"
  else
    soln_hash = Hash.new { 0 }
    solution[:used_coins].each do |coin|
      soln_hash[coin] += 1
    end
    soln_hash
  end
end

# A crappy test framework, but this is just for fun so I guess it's okay
[
  [7,   [3, 1], { 3 => 2, 1 => 1 }  ],
  [8,   [4],    { 4 => 2 }          ],
  [9,   [4],    "No solution"       ],
  [135, [7, 3], { 3 => 3, 7 => 18 } ]
].each do |target, coins, solution|
  throw "Bad test for #{target} / #{coins} / #{solution}" unless best_change(target, coins) == solution
end
