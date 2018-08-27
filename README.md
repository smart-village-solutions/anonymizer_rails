# AnonymizerRails
AnonymizerRails is a small gem  for Rails from Version 4.2 onwards, to anonymize attributes of an
ActiveRecord Model. It doesn't matter if the attributes is a serialized_hash or an ActiveRecord:Store, you can anonymize any attribute/key
no matter how deep it is nested. The attributes values are replaced with a string of 6 x's
```
"xxxxxx"
```
Anonymization for associated models' attributes will be implemented in a future version
of the gem.

## Usage
The Anonymizer gem provides two methods t
## Installation
Add this line to your application's Gemfile if You want use it with Rails 5.2 or higher:

```ruby
gem 'anonymizer_rails'
```
If you want to use it with a lower version of Rails 5 or 4 (Rails 4 only supported from 4.2 onwards)
just add this to your Gemfile:

```ruby
gem "anonymizer_rails", git: "https://github.com/ikuseiGmbH/anonymizer_rails5", branch: "rails-4"
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install anonymizer_rails
```

## Contributing
TBC
## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
