def triangle(a, b, c)
  
  # Triangle inequality theorem:
  # 
  # a + b > c && a + c > b && b + c > a
  
  unless a + b > c && a + c > b && b + c > a
    raise TriangleError.new("Whatever, dude")
  end
    
  if a == b && b == c
    :equilateral 
  elsif a == c || b == c || a == b
    :isosceles
  else
    :scalene 
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

puts triangle(2,2,2)
puts triangle(4,3,4)
#puts triangle(0,0,0)
#puts triangle(3, 4, -5)
#puts triangle(2, 4, 2)
#puts triangle(1, 1, 3)