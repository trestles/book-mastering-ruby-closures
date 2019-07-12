# 4. Building Your Own Lazy Enumerables p57
## Understanding Lazy Enumerables p57
## Building Our Skeleton p59
### External vs Internal Iteration p59
### Creating an Enumerator from an Enumerable p60
### Generators and Fibers, Oh My! p62
## Implementing Lax p63
- super vs super() Notice that the call to super() on line 3 has parentheses. These are absolutely necessary...The difference between super and super() is that the former passes all the parameters from the current method and hands the parameters to the method from the base class, while the latter calls the method without any arguments. p65
- The enumerator and yielder control and manage the supply, while methods such as Enumerator#next() and Enumerator#map() create the demand. Therefore, values get added to yielder only when needed. With the foundation in place, let's implement the map() method. p66
## Implementing Lazy map() p66
- Enumerable::Lax returns a Lax instance, which means we need to define Lax versions of map() and take(). Each invocation of map() and take() will in turn return yet another Lax instance. Recall how the original implementation "wraps" each method call with a "lazy layer". You'll do exactly the same thing here. p66
- Enumerable#first(5)() returns the first five elements of the enumerable, which gives you [2,5,10,17,26]. It is this method that "forces" the Lax enumerable to produce values. p67
## Implementing Lazy take() p67
- Now that you've implemented map(), you can have a go at implementing the take() method...As with the lazy version of map(), the lazy version of take() also returns a Lax instance, this time wrapping the Enumerable#take() method. Here's how it looks p67
## Test Your Understanding! p69
## Wrapping Upp 70
