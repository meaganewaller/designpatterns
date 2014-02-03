# Decorator

The decorator pattern allows for features to be added dynamically to an existing
object. 

With Ruby the simplest way to use the decorator pattern is to create a module
for each decorator. The decorators that you want to use can be dynamically added
to an instance using `extend`. 

Ruby includes a `forwardable` module that provides an easy way to add delegation
methods, `forwardable` may allow you to create cleaner & more readable code, it
really depends on the situation.

## Dynamic Alternatives
Ruby allows for dynamically modifying instances. We can use to this feature to
add decorators at run-time. 

This is a quick approach to adding decorators to an instance. Create an alias
for the original method, then add a module with the same name as the original
method. This is shown below:

````
w = SimpleWriter.new('out')

class << w
  alias old_write_line write_line

  def write_line(line)
    old_write_line("#{Time.new}: #{line}")
  end
end
````

For the `w` instance of `SimpleWriter`, the original `write_line` method still
exists and is pointed to by `old_write_line`. Now when `write_line` is called,
the new method is executed and it then executes `old_write_line`. 

The disadvantage of using `extend` with modules:
  - Can't easily remove modules
  
