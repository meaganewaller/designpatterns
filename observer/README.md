# Observer 

The observer pattern is for **event driven programming**.

An object (the **subject**) maintains a list of its dependents, called
**observers**, and notifies them automatically of any state changes, usually by
calling one of their methods.

The Ruby Standard Library includes an [Observable module](http://ruby-doc.org/stdlib-2.0/libdoc/observer/rdoc/Observable.html) implementing this pattern.

It's possible to use code blocks as observers, as well. This is not supported by
the `Observable` module in the Ruby standard library, but it is easy to
implement.

## Additional Concerns

There are a few additional concerns that should be addressed when working with
the Observable pattern.

### Push v Pull

In the default implementation, the notification sent to the observer doesn't
specify which of the subjects attributes has changed. To find out which
attribute has changed, the Observer has to check the subjects attributes, this
is the *pull* method.

Another approach is the *push* method where the notification includes other
attributes which provide the observer with additional information like the
examples below:

````
observer.update(self, :salary_changed)
observer.update(self, :salary_changed, old_salary, new_salary)
````

An observer may only need to know when a specific attribute of the subject
changes. The simple implementation would notify the observer when any attribute
changes. 

### Atomic Event Notifications

If multiple attributes of a subject are being updated and the updates are not
independent, notifying observers before all the updates are executed could cause
an inconsistent state

````
meagan = Employee.new('Meagan', 'Apprentice', 100000)
meagan.salary =  250000
# Warning! Inconsistent state here!
meagan.title = 'President of the United States'
````


Sometimes an Observer raised an Exception, the correct way to handle exceptions varies from case to case.
