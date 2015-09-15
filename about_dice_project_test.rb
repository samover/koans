class DiceSet
  $roll_result = Array.new
  
  # rolling the dice should return a set of integers between 1 and 6
  def roll(n_times)
    n_times.times { $roll_result.push(rand(1..6)) }
    return $roll_result.to_s
  end
end

dice = DiceSet.new
puts dice.roll(10)