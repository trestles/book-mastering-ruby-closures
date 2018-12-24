# outermost lambda 
Counter = lambda do 
  x = 0 
  get_x = lambda { x } # new scope
  incr = lambda { x += 1 }
  decr = lambda { x -= 1}

  { get_x: get_x, incr: incr, decr: decr }
end

=begin
  Both c1 and c2 get their own x. 

  The scoping rules of Ruby are such that when a lambda is defined, that lambda has access 
  to all variables that are in scope. As the counter example has shown, closures restrict access
  to the variables they wrap. This technique will come in handy in later chapters.

=end