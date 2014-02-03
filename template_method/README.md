# Template Method

The Template Method pattern is simply a fancy way of saying that if you want to
vary an algorithm, one way to do so is to code the invariant part in a base
class and to encapsulate the variable parts in methods that are defined by a
number of subclasses. 

1. Create a **skeletal class** with methods that are common between algorithms
2. Create a **subclass** for each algorithm and override the common methods from
   the skeletal class.

Disadvantages:
  - No runtime flexibility
