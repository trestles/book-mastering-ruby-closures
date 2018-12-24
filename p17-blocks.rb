=begin

- blocks are effectively a type of closure. Blocks capture pieces of code that can be passed into 
methods to be executed later. In a sense, they act like anonymous functions

- yield
- block_given?

Block Pattern #1 Enumeration
Block Pattern #2 Managing Resources
Block Pattern #3 Beautiful Object Initialization

=end

Array(1..20).select {|x| x.even? }  # p18

Array(1..20).select {|x| x.even? and x > 10 }  # p18

# p18 - 19

require 'ostruct'

catalog = []

catalog << OpenStruct.new(name: 'Nike', qty: 20, price: 99.00)
catalog << OpenStruct.new(name: 'Adidas', qty: 10, price: 109.00)
catalog << OpenStruct.new(name: 'New Balance', qty: 2, price: 89.00)

catalog.sort_by { |x| x.price }
catalog.sort_by { |x| x.qty }

def do_it
  yield
end

do_it { puts "I'm doing it" }

do_it { [1,2,3] << 4 }

def do_it(x, y)
  yield(x, y)
end


do_it(2,3) { |x,y| x + y }

do_it("Ohai", "Benevolant Dictator") do |greeting, title|
  "#{greeting} #{title}"
end

=begin

There's a tiny gotcha to yield's argument-passing behavior. It is more tolerant of missing 
and extra arguments than you might expect. Missing arguments will be sent to nil and extra 
arguments will be silently discarded.

=end

# Blocks as closures and Block Local Variables

def chalkboard_gag(line, repitition)
  repitition.times { |x| puts "#{x}: #{line}"}
end

chalkboard_gag("I will not drive the principal's car"), 3)

def chalkboard_gag(line, repitition)
  repitition.times { |x; line| puts "#{x}: #{line}"}
end

x = "outside x"
1.times { x = "modified from outside the block"}
puts x

x = "outside x 2"
1.times { |;x| x = "x modified from outside the block" }
puts x