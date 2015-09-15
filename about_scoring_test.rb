# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.

def score(dice)

  points = 0
  
  # iterate through each eye of the dice
  [1, 2, 3, 4, 5, 6].each do |eyes|
    
    count = dice.count(eyes)

    case eyes
    when 1
      count >= 3 ? points += 1000 + (100 * (dice.count(1) - 3)) : points += ( dice.count(1) * 100 )
    when 5 
      points += ( 500 + ((count - 3) * 50) ) if count >= 3
      points += (count * 50) if count < 3
    else
      points += (eyes * 100) if count >=3
    end
  end

  return points
end

=begin
def score(dice)

  points = 0
  
  [1, 2, 3, 4, 5, 6].each do |eyes|
    
    count = dice.count(eyes)

    if eyes == 1 && count >= 3
      points += 1000 + (100 * (dice.count(1) - 3))
    elsif eyes == 1 && count < 3
      points += ( dice.count(1) * 100 )
    end
    
    if eyes != 1 && count >= 3
      points += (eyes * 100)
      count -= 3
    end
      
    if eyes == 5
      points += (count * 50 )
    end
   end
  return points
end
=end

puts score([])
puts score([5]) 
puts score([1])
puts score([1,5,5,1])
puts score([2,3,4,6])
puts score([1,1,1])
puts score([2,2,2])
puts score([3,3,3])
puts score([4,4,4])
puts score([5,5,5])
puts score([6,6,6])
puts score([2,5,2,2,3])
puts score([5,5,5,5])
puts score([1,1,1,1])
puts score([1,1,1,1,1])
puts score([1,1,1,5,1])