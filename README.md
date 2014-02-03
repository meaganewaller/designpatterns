# Design Patterns in Ruby

Design Patterns implemented in Ruby.

## Purpose of Design Patterns

1. Separate the things that change from the things that stay the same
  - Promotes DRY code
  - Improves maintainability

2. Program to an interface, not an implementation
  - Code should belong to the most general object possible and specific classes
    should inherit from the general class
  - Increases modularity

3. Prefer composition over inheritance
  - Avoid saying that an object is a kind of something and instead say that is
    has something.
  - In other words, it's often better to reference other classes or modules than
    to put functionality in superclasses
      - Increases encapsulation
      - Increates modularity, implementation can be easily swapped

4. Delegation, let other classes handle functionality within their domain

5. YAGNI (You ain't gonna need it) **addition by Russ Olsen**
  - Don't implement features or design in flexibility that you don't immediately
    need because you will probably never need it.

# Design Patterns

- [Adapter](https://github.com/meaganewaller/designpatterns/tree/master/adapter)
- [Proxy](https://github.com/meaganewaller/designpatterns/tree/master/proxy)
- [Decorator](https://github.com/meaganewaller/designpatterns/tree/master/decorator)
- [Template
  Method](https://github.com/meaganewaller/designpatterns/tree/master/template_method)
- [Strategy](https://github.com/meaganewaller/designpatterns/tree/master/strategy)
