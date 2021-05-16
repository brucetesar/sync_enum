# SyncEnum

Iterate over multiple enumerators in parallel, using the external interface
based on the #next method. Each call to #next returns an array, containing
the next element for each of the enumerators. A StopIteration exception
is raised as soon as any of the enumerators runs out of elements.

SyncEnum differs from the standard library's REXML::SyncEnumerator in its
use of the #next external iterator interface, while REXML::SyncEnumerator
uses an #each internal interator interface. The external interface is more
convenient when you expect to end iteration before reaching the end of
any of the enumerations, including cases where an enumerator generates
an unending sequence.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sync_enum'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sync_enum

## Usage

Require the sync_enum gem in your code:

```ruby
require 'sync_enum'
```

Create a new SyncEnum by giving the constructor the enumerators as
arguments:

```ruby
se = SyncEnum.new(enum1, enum2, ...)
```

Each call to #next will return an array of the next elements of the
enumerators, in the same order as the enumerators were given to the
constructor.

```ruby
se.next # => [enum1.next, enum2.next, ...]
```

This can be used in a loop construction, where the loop keyword silently
rescues the StopIteration exception.

```ruby
se = SyncEnum.new(enum1, enum2, enum3)
loop do
  values = se.next
  next_from_enum1 = values[0]
  break if condition_for_stopping_early
end
# To get here, either one of the enumerators ran out of elements, or the
# break statement was executed.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and
then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/brucetesar/sync_enum. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to
adhere to the
[code of conduct](https://github.com/brucetesar/sync_enum/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SyncEnum project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/brucetesar/sync_enum/blob/master/CODE_OF_CONDUCT.md).
