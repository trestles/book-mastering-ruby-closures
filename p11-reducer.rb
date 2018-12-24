

a = [1,2,3,4,5].reduce(10) { |acc, x| puts "#{acc}, #{x}"; acc + x }

puts a

adder = lambda do |acc, arr|
  if arr.empty?
    acc
  else
    adder.call(acc + arr.first, arr.drop(1))
  end
end

multiplier = lambda do |acc, arr|
  if arr.empty?
    acc
  else
    multiplier.call(acc * arr, arr.drop(1))
  end
end

reducer_one = lambda do |acc, arr, binary_function|
  if arr.empty?
    acc
  else
    reducer_one.call(binary_function.call(acc, arr.first), arr.drop(1), binary_function)
  end
end

b = reducer_one.call(1, [1,2,3,4,5], lambda { |x, y| x + y})

puts b

reducer_two = lambda do |acc, arr, binary_function|
  reducer_aux = lambda do |acc, arr|
    if arr.empty?
      acc
    else 
      reducer_aux.call(binary_function.call(acc, arr.first), arr.drop(1))
    end
  end
  reducer_aux.call(acc, arr)
end

c = reducer_two.call(1, [1,2,3,4,5,6], lambda { |x,y| x + y })

puts c
