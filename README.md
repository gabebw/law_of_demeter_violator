# Law Of Demeter Violator

`user.name` is for sissies who think patterns are cool. You and me, we know that
the Gang of Four were [communists](http://en.wikipedia.org/wiki/Gang_of_four).
Let's do `user.name.name` instead.

## Installation

Add this line to your application's Gemfile:

    gem 'law_of_demeter_violator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install law_of_demeter_violator

## Usage

You have two options.

1) include the `LawOfDemeterViolator` module in your class, at the end:

    class BadIdea
      def meth1
      end

      include LawOfDemeterViolator
    end

Unfortunately, it has to be at the end of the class definition.

2) use the global `Violate` method:

    Violate(BadIdea)

## Is it tested?

Of course. I'm not a monster.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
