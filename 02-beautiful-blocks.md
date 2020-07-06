
#### Mastering Ruby Closures 

# 2 Beautiful Blocks p17
- Blocks are effectively a type of closure. Blocks capture pieces of code that can be passed into methods to be executed later. In a sense, they act like anonymous functions p17
- In order to understand and appreciate real-world Ruby code, it's imperative you understand how blocks work and how to use them. p17
- Blocks are also instrumental in crafting domain-specific languages, or DSLs. This ability has been exploited to great efffect, especially in tools such as Rake and Rails. p17
- There are two main objectives in this chapter
  - 1 - The first is to make sure you understand how blocks are used. In order to do that, you will learn about the `yield` keyword and the `block_given?()` method by writing your own methods that take blocks as input. You will also learn block variables are, and their relationship to blocks acting as closures. p17
  - 2 - The second objective is to get you well acquainted with the various ways that blocks are used in Ruby - block patterns if you will. You will write code that enumerates a collection such as an array or a hash. Having the skills to use blocks in conjunction with the classes in the Ruby Standard Library will save you precious time especially when you start to realize how blocks can make methods extremely versatile. p18
- Along the way, you will get to work with some meta-programming goodness and learn the secret to creating Ruby DSLs. p18
## Separating the General from the Specific p18
- The ability to encapsulate behavior into blocks and pass it into methods is an extremely useful programming technique. This lets you separate the general and specifice pieces of your code. p18
- In both instances, all you have to change was the code in the block. In face, you didn't have to change the implementation of Enumerable#sort_by(). You were able to trust the method would do its job provided you gave it a reasonable sorting criteria to work with. So how is this possible? With `yield` p19
## Executing Blocks with the yield Keyword p19
- When you see `yield` anywhere in a Ruby block, you should think "execute the block" p19
- There's a tiny gotcha to `yield`'s argument-passing behavior. It is more tolerant of missing and extra arguments than you might expect. Missing arguments will be set to `nil`, and extra arguments will be silently discarded. p20
- If you find this behavior slightly strange, you can think of `yield` as acting a little like a parallel assignment in that `nils` are assigned to missing arguments. p20
- What happens in the `yield` is given more arguments than expected? Once again, think about the parallel assignment analogy: p21
## Blocks as Closures and Block Local Variables p21
- In Ruby, blocks act like anonymous functions. After all, blocks carry a bunch of code, to be called only when `yield`ed. A block also carries around the context in which it was defined: p21
- Block local variables are a way to ensure that the variables within a block don't override another outer variable of the same name. This essentially circumvents the variable capturing behavior of a closure. p22
## Block Pattern #1: Enumeration p22
- You should be familiar with this way of iterating over a collection, such as an Array. What is interesting is how these methods are implemented under the hood. Going through the implementation will give you a much deeper understanding of how methods and blocks work.  p23
### Implementing Fixnum#times p23
- What can we say about `Fixnum#times()` method? Well, it executes the block exactly three times. This information is taken from the instance of the Fixnum 3. This detail is important, as you will soon see. p23
- The most important part of the code is `yield`. In this example, `yield` is called without any arguments which is exactly what the original implementation expects. The return value of the times() method is the number itself, hence `self` is returned at the end of the method. p25
### Implementing Array#each p25
- Since you don't have the help of `Array#each()` (that's the whole point of this exercise), the iteration needs to be tracked manually. Once again, it's time for the humble `while` loop: p25
- Notice how `self` is being used here. First, the `while` loop uses `self.length` to determine if it should continue looping or break out of the loop. Second, the individual elements of the array are accessed via `self[x]`. The value of this is passed into the supplied block, which, in our example, simply prints the elements out. p26
## Block Pattern #2: Managing Resources p26
- Blocks are an excellent way to abstract pre- and post-processing. A wonderful example of this is resource management. Examples of resources that require extra care include file handles, socket connections, and database connections. For example, failure to close a database connection means that down the line, another connection might be refused, since the number of connections that a database can handle is finite and limited. p26
- Remembering to open and close the resource is a largely manual affair p26
- But if you have a long-running application like daemon or web-application, then this is bad news. That's because the operating system can only support a finite number of file handles. p26
- In other words, you have a resource leak on your hands. p27
- If you think about it, the only thing we really want is to write to the file. Having to remember to close the file handle is a hassle. Ruby has a very elegant way of doing this, using blocks: 

```
File.open('Leo Tolstoy - War and Peace.txt', 'w') do |f|
  f << "Well, Prince, so Genoa and Lucca"
  f << " are now just family estates of the Buonapartes."
end 
```

- Notice that the file handle is nicely scoped within the block. In other words, `f` only exists the confines of the block. But where exactly is the file closing taking place. Let's find out. 
### Implementing File.open p27
## Block Pattern #3: Beautiful Object Initialization p29
```
client = Twitter::REST::Client.new do |config|
  config.consumer_key = "YOUR_CONSUMER_KEY"
  config.consumer_secret = "YOUR_CONSUMER_SECRET"
  config.access_token = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end
```
### Implementing an Object Initialization DSL p30

```
def initialize
  yield self if block_given? 
end
```

### Implementing a Router DSL p31
### Using instance_eval to Change self p33
### Changing context with instance_eval p34
### Block-to-Proc Conversion p35
- We have not covered `Procs` yet. For now, think of them as lambdas. Blocks are not represented as objects in Ruby. However, instance_eval() expects to be given an object. Therefore, we need to somehow turn a block into an object. p35

```
def initialize(options = {}, &block)
  options.each { |k,v| send("#key=", v) }
  instance_eval(&block) if block_given?
end
```
### Object Initialization, Revisited p36
## Test Your Understanding p37
## Wrapping Up p56
