
#### Mastering Ruby Closures 

# 3. The Power of Procs and Lambdas p41
## Procs and the Four Ways of Calling Them p42
- In fact, Ruby gives you four different ways:
  - 1. Proc#call(args) p42
  - 2. .(args)()
  - 3. Three equals 
  - 4. Lambdas 
- There are two things to notice here. First, the return value tells you that a `Proc` has been created. Second, Ruby provides a shorthand to create `Procs` p42
- Of course, since `Proc` is just like any other class, you can create an instance of it the usual way: 
```
>> p = Proc.new { |x,y| x + y }

```
or 
```
>> p = proc { |x,y| x + y }
>> p.call("oh", "ai")
=> "ohai"

>> p.call(4,2)
=> 6
```

## Lambdas - Same, But Different p44
- Procs have a lot of similarities to lambdas. In fact, you might be surprised to learn that a lambda is a Proc:
```

```
- A Proc, however is not a lambda p44
- Invoking lambdas is identical to invoking Procs, with the exception of the lambda keyword p44
- If you find typing lambda too verbose for your taste, Ruby offers an alternative, affectionately know as the stabby lamda syntax: p44
### The difference between a Lambda and a Proc p45
- A `lambda` and a `proc` have two important differences: arity and return semantics p45
- Turns out, `lambdas` get upset if you give them less arguments than expected. p45
- So, the moral of the story is that `lambdas`, unlike `Procs`, expect the exact number of arguments to be passed in. For `Procs`, unassigned arguments are given nil. Extra arguments are silently ignored. p46
- Should I use lambdas or Procs? p47
  - For the most part, you should be fine using lambdas. That's because the return semantics of lamdas resembe the intuitive behavior of methods. p47
  - Sometimes though, you might want to use Procs. One reason might be you need multiple aritites to be supported. You'll learn more in the Symbol#to_proc() section where you'll reimplement a very nifty Ruby trick made possible by Procs. p47
## How Symbol#to_proc Works p47
- When Ruby sees an `&` and an object - any object - it will try to turn it into a block. This is simply a form of type coercion. p48
- Take to_s() for example. Ruby allows you to do `2.to_s`, which returns the string representation of the integer 2. Similarly, `to_proc()` will attempt to turn an object - again, any object - into a Proc. p48
### Reimplementing Symbol#to_proc p48
- In other words, `send()` allows you to dynamically invoke methods using a symbol. p50
### Improving on Symbol#to_proc 
- Recall that unlike lambdas, Procs are more relaxed when it comes to the number of arguments they're given. It's therefore easy to circumvent this limitation. It's instructive to see what happens when a lambda is used instead of a Proc. p50
- This is one of the few places where having a more relaxed requirement with respect to arities is important and even required. p52
## Currying with Procs p52
- The word "curry" comes from the mathematician Haskell Curry... In functional programming, currying is the process of turning a function that takes n arguments into one that takes a single argument, but returns n functions that take one argument. p52
- For example, given a lambda that accepts three parameters: 
```
>> discriminant = lambda { |a,b,c| b**2 - 4*a*c }
>> discriminant.call(5,6,7)
```
- you could convert it into this:
```
>> discriminant = lambda { |a| lambda { |b| { lambda |c| { b**2 - 4*a*c }}}}
>> discriminant.call(5).call(6).call(7)
```
- In Ruby, there's a shorter way to do this using Proc#curry():
```
>> discriminant = lambda { |a,b,c| b**2 - 4*a*c }.curry
=> -104
```

- Notice that using Proc#curry() alleviates the need to have nested `lamdas` as seen in the previous example. p53
- Currying is very useful in function languages (and languages such as Haskell use it to great effect), but you can see examples of this in Ruby:

```
>> greeter = lamda do |greeting, salutation, name|
  "#{greeting} #{salutation} #{name}"
end

>> dear_greeter = greeter.curry.call("Dear") # p53

```
## Test Your Understanding! p55
## Wrapping Up p56
