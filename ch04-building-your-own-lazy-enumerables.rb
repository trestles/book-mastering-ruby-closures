=begin


Implementing Lax p63

Implementing Lazy map() p66
  "Lets implement method chaining on methods such as map() and take(). Enumerable::Lax returns a 
   Lax instance which means we need to define Lax versions of map() and take(). Each invocation of map()
   and take() will in turn return yet another Lax instance
  "

Implementing Lazy take() p67
  "When taken reaches the limit, a StopIteration is raised to break out of the block" p68

  "handle exception in the initialize method" p68
=end


module Enumerable
    def lax
      Lax.new(self)
    end
  end
  
  class Lax < Enumerator
  
    def initialize(receiver)
      super() do |yielder|
        begin
          receiver.each do |val|
            if block_given?
              yield(yielder, val)
            else
              yielder << val
            end
          end
        rescue StopIteration
        end
      end
    end
  
    def map(&block)
      Lax.new(self) do |yielder, val|
        yielder << block.call(val)
      end
    end
  
    def take(n)
      taken = 0
      Lax.new(self) do |yielder, val|
        if taken < n
          yielder << val
          taken += 1
        else
          raise StopIteration
        end
      end
    end
  end

=begin

1.upto(Float::INFINITY).lax.map { |x| x*x }.map { |x| x+1 }.take(5).to_a


1.upto(Float::INFINITY)
  .lax
  .map { |x| x*x }
  .map { |x| x+1 }
  .take(5)
  .to_a
=end 