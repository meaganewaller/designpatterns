# Adapter Pattern

> What do you do when an object does what you need it do, but its interface is
> wrong? Your interface mismatch might be very deep and complex, or it might be
> as simple as needing an object that can `write` but having an object that
> calls it `save`. The GoF would recommend an Adapter to you

- Russ Olsen's [Design Patterns in Ruby](http://www.amazon.com/Design-Patterns-Ruby-Russ-Olsen/dp/0321490452)

- Ruby allows us to modify objects and classes on the fly at runtime, this eases
  the burden of creating adapters.

- An adapter is an object that crosses the chasm between the interface that you
  have and the interface that you need.


## Encrypter Example

The example comes from the same book. We have a class that encrypts files called
`encrypter.rb`. It uses the `encrypt` method, which takes two open files as
arguments, one for reading, and one for writing, as well as a key. It writes an
encrypted version of the input file to the output file, one byte at a time.
Using the `Encrypter` class to encrypt a regular file is easy. You just open the
two files and call `encrypt` with the secret key of your choosing:


````
reader = File.open('foo.txt')
writer = File.open('foo.encrypted', 'w')
encrypter = Encrypter.new('the secret key')
encrypter.encrypt(reader, writer)
````

But what if the data we want to secure is in a string instead of a file? We will
need an object that looks like an open file, and supports the same interface as
the Ruby `IO` object on the outside, but will actually get charachters from the
string on the inside. We need a `StringIOAdapter`.

Our `StringIOAdapter` has two instance variables: a reference to the string and
a position index. Each time `getc` is called, `StringIOAdapter` will return the
character at the current position in the string, incrementing the position as it
goes. The `getc` method raises an exception if there are no more characters left
in the string. The `eof?` method returns `true` if we have run out of characters
and `false` otherwise. To use `Encrypter` with `StringIOAdapter` you just have
to replace the input file with an adapter

````
encrypter = Encrypter.new('OURSTRING')
reader = StringIOAdapter.new('This is our string')
writer = File.open('out.txt', 'w')
encrypter.encrpyt(reader, writer)
````

The `StringIOAdapter` class is our adapter, it looks like an ordinary `IO`
object on the outside but it actually gets its characters from a string, which
is the adaptee.


## Renderer Example

Our next example is one that you might see a lot, its where things *almost*
perfectly line up, but not quite. We have our `Renderer` class that renders text
to a screen. It renders objects that look like our `TextObject` class. However,
what if we get something like our `BritishTextObject` class, where we don't use
inches and color is spelled with a u? Fortunately, `BritishTextObject` basically
contains everything we need to get this working properly, the unfortunate part
is that our field is called `string` instead of `text`, it's in millimeters, and
we have `colour` instead of `color`. However, let's use the Adapter pattern and
solve this problem! Check out `BritishTextObjectAdapter` to see how we solved
it. 

Now let's look at a different way of solving the problem, let's see how we can
use the ability to modify a class on the fly! If we don't want to actually build
an adapter for the `BritishTextObject` we don't have to. We can just change the
original `BritishTextObject` to look how we need it to. 

First we need to make sure that the original `BritishTextObject` class is
loaded, and then we reopen the class and add some methods to it. (See our
`main.rb` file)

The `require` at the top loads the original `BritishTextObject` class, and
doesn't create a new class but reopens the exisiting class and adds some
methods. The ability to modify classes is what makes Ruby so flexible and
powerful, but can also be dangerous if you're not careful. 

Modifying an entire class can be kind of intimidating, right? Well, not to fear,
we can also modifying a single instance. Check out `main.rb` to see this. The
key is the `class << bto` bit of code. This code modifies the behavior of the
`bto` object independently of its class. We can also achieve this another way,
take a look at `main.rb`. Ruby calls the methods that are unique to an object
singleton methods, and a singleton class is the first place where Ruby looks
when you call a method, so any method defined in the singleton class will
override the methods in the regular class. The code modifies the singleton class
of the `bto` object, and even after it has been modified the object will still
claim to be of its old, orginal class.

## To Adapt or Modify, That is the Question.

As we can see Ruby makes it super easy to modify a class or a single instance to
support an interface that we need. This is way simpler codewise than creating an
adapter because we simply don't need an adapter class, or need to worry about
wrapper the adapter around the adaptee when we modify the original class.
However, modifying a class isn't all rainbows and butterflies, when we just
start changing things we break some encapsulation rules and could potentially
mess things up. But, there are some times when we should prefer to modify the
class, like:

  - When modifications are simple and clear. The example above is a good example
  of clear and simple modification

  - You understand the class you're modifying and the way in which it is used. If
  you just modify a class without actually understanding what it is doing that
  can lead to some serious trouble. (Just because you can modify `Fixnum` in
  Ruby, doesn't mean you should, for example)


You should probably use an adapter if:

  - The interface mismatch is really complex. You aren't going to want to modify
    a string to look like a `Fixnum` object, for example.

  - You have no idea how the class works. 

> Adapters preserve encapsulation at the cost of some complexity. Modifying a
> class may buy you some simplification, but at the cost of tinkering with the
> plumbing.

## Wrap Up

Adapters are something we probably use everyday whether or not we realize it,
not just in regards to software. When traveling to another country you use an
adapter for the sockets, when charging an iPhone 5 and all you have our iPhone 4
chargers we can use an adapter to make it work. Adapters aren't that
complicated, and become a lot easier to implement when we notice the differences
between interfaces that we need and the objects that we have. An adapter
supports the interface that we need on the outside, but it implements the
interface by making calls to an object hidden inside -- an object that does
everything we need it do, but does it via the wrong interface. 

When it comes to Ruby we can solve the *wrong interface* problem by modifying
the object at runtime and making it have the right interface. If you're aware of
how the things works and the interface changes are minor, like what we dealt
with in the examples, modifying the object might be the better way to go. But if
it's too complex or we don't quite understand what it's doing it's best to use
an adapter class. 

Adapters are part of the family of patterns where an object stands in for
another object (also included are proxies and decorators). These patterns have
an object that acts like a front man for another object. And remember, an
adapter is an adapter only if you are stuck with objects that have the wrong
interface and you're trying to keep the pain of dealing with bad interfaces from
spreading throughout your program. 


