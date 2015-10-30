# Olery
Little gem to extract url from hotels

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'olery'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install olery

## Usage

# Configure scraping resources
```ruby
Olery.configure do |config|
  config.add Olery::Resource.new("tripadvisor.com", "/Search", "get",  "q", {}, trip_advisor_parser)
  config.add Olery::Resource.new("booking.com", "/searchresults.en-gb.html", "get", "ss", { si: "ai,co,ci,re,di" }, booking_parser)
  config.add Olery::Resource.new("holidaycheck.de", "/schnellsuche.php", "post", "query", holiday_check_parser)
end

```
## TODO
 * Fix parsers...

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/olery. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

