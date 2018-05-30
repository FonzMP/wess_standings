# WessStandings

## About

This application serves as a general purpose race schedule, race description, and race results application for the 2018 World Enduro Super Series (WESS) motorcycle championships. With an early start in the season, there's a lot of excitement still to come.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wess_standings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wess_standings

## Usage

To access the season schedule, input 'schedule' when prompted.
Within the schedule mode, you'll be able to select from a list of races. By selecting a race number, you'll be able to view a brief description of the race directly from it's website.

To access the results page, input 'results' when prompted.
Within the results mode, you'll be able to select from a list of races. By selecting a race number, you'll be displayed the 'short' version of the results showing the top 50 riders from that race. You can type 'short' to see this list, or type 'full' to see the full results of the race.

To exit the program, input 'exit' when prompted.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wess_standings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WessStandings project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wess_standings/blob/master/CODE_OF_CONDUCT.md).
