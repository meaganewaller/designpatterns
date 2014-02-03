# Proxy Pattern

## Types of Proxies

### Protection Proxy

A protection proxy protects an object from unauthorized access. To ensure
methods can only be run by authorized users. We can verify this by running an
authorization check before messages are passed to the underlying object.

### Remote Proxy

Remote proxies provide access to objects that are running on remote machines. An
example of a remote proxy is Distributed Ruby (DRb), which allows Ruby programs
to communicate over a network. With DRb, the client machines runs a proxy which
handles all of the network communications behind the scenes.

### Virtual Proxy

Virtual proxies allows us to delay the creation of an until it's absolutely
necessary. This is useful when the creation of an object is computationally
expensive. 


## Using Message Passing to Simplify Proxies

When we build a proxy, we could implement a method for each method in the
underlying object. But this leads to a lot of code repetition and tightly
couples the proxy with the underlying object. A better solution is to pass
method calls directly to the underlying object. Ruby includes a method that is
perfect for this situation called `method_missing`.

In Ruby, when you call a method on an object it looks for a method in the
initial object and its modules and then works it way up the stack to that
object's superclass and then its superclass and so on. If the method isn't
found, Ruby looks for the method `method_missing` in the initial object, then
its parent, and its parent, etc.

Instead of implementing each of the underlying objects method in the proxy, we
can use `method_missing` to simply pass method calls to the underlying object.

This has a couple advantages:

  1. The proxy is super simplified by having far fewer methods
  2. The proxy isn't coupled to the underlying object and can be reused for
     multiple object classes
