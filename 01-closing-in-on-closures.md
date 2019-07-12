# 1 Closing in on Closures p1
## The Foundations of a Closure p1
- A closure is essentially a function whose body references a variable that is declared in the parent scope p1
- The key to understanding closures is to grasp two other programming language concepts: `lexcial scoping` and `free variables` p2
### Lexical Scoping: Closest Variable Wins p2
### Identifying Free Variables p3
- Lambdas are Ruby's version of anonymous functions found in other languages p3
- Rules of identifying a closure p4
### Rules of identifying a closure p4
- At this point, you might be thinking: what interesting things can I do with closures. The answer might surprise you! p5
## Simulating Classes with Closures p5
- If you think about it, classes are a way of packaging up data and behavior. Instances created of a class are distinc from each other. In other words, each instance has its own state. Closures also provide that functionality. Let's see how with an example. p5
- So there you have it: It's entirely possible to have objects without classes. In fact, this technique is often used in Javascript to make sure that variables do not leak and inadvertantly become overridden by some other function or operation. p7
- As the counter example has shown, closures restrict access to the variables they wrap. This technique will come in handy in later chapters. p7
## Implementing Callbacks in Ruby with Lambdas p7
- Although Ruby is an object-oriented language, supporting features such as lambdas blur the lines between object-oriented and functional programming. p9
- In particular, the feature that you might be thinking about is passing around functions as first-class values. p9
### First-Class Values p9
- So yes, a lambda can most definitely passed into a lambda. Now, for the final hurdle: can a lambda be return value. Modify `component()` so that it only takes in one argument. p9
- As you can see, we have been treating lambdas as first-class functions all along. Being able to pass around functions like values means that we can conveniently assign, pass around, and return tiny bits of computation. p10
- It should be noted that Ruby's methods are not first-class functions. Instead, lambdas, Procs, and blocks step in to fill that role. p10
- We will circle back now to implementing `Notifier` and see how first-class functions can lead to decoupled code. p10
- There's a tiny subtlety that is easy to miss, and that's where the beauty of this technique lies. Take a closer look at how the `on_success` callback is define:
```
on_success: lambda { |r| puts "Send #{r} to boss@acme.co" }
```
- What's the value of r? Well, at the point where this lambda was defined, no one knows. It's only at the point when we know that the generated report is non-nil do we pass the result into the success callback p11
- Notice that notifier doesn't dictate `how` you should handle success and failure cases. All it does is invoke the appropriate callbacks. This means that you are free to log errors to a file or send your boss an SMS when a report has been succesfully generated - all without modifying the original `Notifier` class p11
## Implementing Enumerable#reduce() (or Fold Left) p11
- Ruby already has an implementation in the `Enumerable` class. However, for our purposes, we are only going to use lambdas. p11
- `reduce()` (sometimes known as fold left) is one of the operations that can be found in almost every functional programming language p11
### Summing values using reduce() p12
```
adder = lambda do |acc, arr| # p12
  # to be filled in
end
adder.call(10, [1,2,3,4,5]) #=> 25
```
- implemented as: p13
```
adder = lambda do |acc, arr|
  if array.empty?
    acc
  else
    adder.call(acc + arr.first, add.drop(1))
  end
end
```
- Notice the recursive call to `adder` on line 5. Each call adds the first element of the array to the accumulator. It also decreases the size of the array by removing the first element of the array. p13
### Multiplying Values Using reduce() p13
### Abstracting a Reducer p14
- This implementation using lambdas is very similar to how functional languages might implement it. Having lambdas as a language construct enables a very different kind of programming style that you might not otherwise be used - a testament to the versatility of Ruby. p15
## Test your Understanding p15
## Wrapping Up p16
