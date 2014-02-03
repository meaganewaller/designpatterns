# Strategy

The basic idea of this design pattern is to delegate tasks to encapsulated
algorithms which are interchangeable at runtime.

In the Strategy pattern we have an object (the **context**) that is trying to
get something done. However, to get that thing done, we need to supply the
context with a second object, called the **strategy**, that helps get the thing
done.

1. Define a family of objects which all do the same thing (example: format
   output, generate graphics, etc)
2. Ensure the family of objects share the same interface so that they are
   interchangeable. 

There are two strategies to passing data from the context object to the strategy
object. We can pass the data as parameters when the strategy is called, or we
can pass the context object as the single parameter.

If the strategies are very simple and have only one method, we can even use code
blocks for our algorithms and simply use `block.call`. However, if multiple
methods are needed, the strategies must be structured as separate classes. 

**Advantages**

  - Algorithms are interchangeable at runtime
  - Promotes modularity

