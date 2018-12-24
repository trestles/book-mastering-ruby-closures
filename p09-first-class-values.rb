=begin

The notion of first-class-values???

Are lambdas values? p09
- can assign to a variable
- can pass them into methods
- can be return values of methods

=end

# be assigned to a variable
is_even = lambda {|x| x % 2 == 0 }

puts is_even.call(4)

puts is_even.call(5)

# can a lambda be passed into a method p09

def complement(predicate, value)
  not predicate.call(value)
end

puts complement(is_even, 4)

puts complement(is_even, 5)

# can a lambda return a value

def complement(predicate)
  lambda do |value|
    not predicate.call(value)
  end
end

puts "-------------"

puts complement(is_even)

puts complement(is_even).call(4)

puts complement(is_even).call(5)