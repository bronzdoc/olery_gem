# Olery
Little gem to extract url from hotels

# Demo
[![asciicast](https://asciinema.org/a/2cu15gcxad4cd94v2uj4470pa.png)](https://asciinema.org/a/2cu15gcxad4cd94v2uj4470pa)


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

# Creating a parser
```ruby
hotel_parser1 = Proc.new do |page, word|
  your parser logic...
end
```

# Configure scraping resources
```ruby
#Resource.new(host, endpoint, method, text_box_query_param, extra_query_args, parser)
Olery.configure do |config|
  config.add Olery::Resource.new("hotels1.com", "/Search", "get",  "q", {}, hotel_parser1)
  config.add Olery::Resource.new("hotels2.com", "/searchresults.en-gb.html", "get", "ss", { si: "ai,co,ci,re,di" }, hotel_parser2)
  config.add Olery::Resource.new("hotels3.de", "/schnellsuche.php", "post", "query", hotel_parser3)
end
```
## TODO
 * Integration tests

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/olery. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

