
=begin
#### Mastering Ruby Closures 

Recall that blocks by themselvese are not objects - they cannot exist by themselves (? - what does that mean) p41


Procs have no such restrictions, because they are objects.

 Procs are ubiquitous in real-world ruby code, although chances are you might not be using them that much. 

Procs also assume another form: lambdas p41

currying - a functional program concept p41

Procs and four ways to call them
1. Proc#call(args)
2. .(args)()
3. Threequals
4. Lambdas

=end


=begin

Lambdas - Same But Different p44
  - The difference between a Lamda and a Proc p45
  - How Symbol#to_proc works p47
  - Reimplementing Symbol#to_proc p48
  - Improving on Symol#to_proc p50

=end 
