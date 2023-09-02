# Stocksy

Stocksy is a command line tool that displays stock market information obtained from the [Alpha Vantage API](https://www.alphavantage.co/).

## Installation

Install the gem by executing:

    $ gem install stocksy

## Usage

Get a free API key from [Alpha Vantage](https://www.alphavantage.co/) and set it up with `stocksy login [API key]` or with the "ALPHA_VANTAGE_API_KEY" environment variable so Stocksy can get data.

You can review the full list of commands by running `stocksy help`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brunoprietog/stocksy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/brunoprietog/stocksy/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stocksy project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/brunoprietog/stocksy/blob/master/CODE_OF_CONDUCT.md).
