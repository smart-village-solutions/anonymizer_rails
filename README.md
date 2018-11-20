[![Maintainability](https://api.codeclimate.com/v1/badges/1c6d704b29a9599a3df7/maintainability)](https://codeclimate.com/github/ikuseiGmbH/anonymizer_rails5/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/1c6d704b29a9599a3df7/test_coverage)](https://codeclimate.com/github/ikuseiGmbH/anonymizer_rails5/test_coverage)

# AnonymizerRails
Sometimes it is necessary to scramble `user_data` in a clean and fast way.
AnonymizerRails provides the functionality to do this. AnonymizerRails is a small gem for Rails
4.2 and higher, to anonymize attributes of an `ActiveRecord` model. It doesn't matter if the attribute
is a `serialized_hash` or an `ActiveRecord:Store`. You can anonymize any attribute/value, no matter how deep
it is nested. The attribute's value(s) are replaced with a string of 6 x's:
```
"xxxxxx"
```

Anonymization for associated models' attributes will be implemented in a future version
of this gem.

## Supported Rails versions

- 4.2 and higher

## Usage
The AnonymizerRails gem adds two methods to your `ActiveRecord` models:
- `data_to_anonymize`
- `anonymize_data`

The first one, `data_to_anonymize`, is a class method. It is used to configure
which attributes should be anonymized. In your model it is called like this:
```ruby
class Foo < ApplicationRecord
  data_to_anonymize :name
end
```

If you want to anonymize more than one attribute, you have to wrap the attributes in an array e.g. like this:
```ruby
class Foo < ApplicationRecord
  serialize :address
  data_to_anonymize [:bic, :iban, { address: [:city, :zip] }]
end
```

The above code tells the gem that when `anonymize_data` is called on any instance of `Foo`, it should anonymize
the attributes `name`, `age`, `submitted_input[:user_location][:city]` and `submitted_input[:user_location][:country]`.

`anonymize_data` is an instance method added to every `ActiveRecord` instance. When called on a record, it
anonymizes the configured attributes:
```ruby
 @foo = Foo.create(name: "Tim", surname: "Test", bic: "BKR532836FR", iban: "DE12345678", address: { zip: "12345", city: "Berlin" })
 @foo.anonymize_data
 @foo.save

 @foo
 #<Foo id: 1, bic: "xxxxxx", iban: "xxxxxx", name: "Tim", surname: "Test", address: {:zip=>"xxxxxx", :city=>"xxxxxx"}, created_at: "2018-08-28 14:20:42", updated_at: "2018-08-28 14:20:42">
```

#### !!!Attention!!!: The `anonymize_data` method doesn't save anonymized records to the database.
#### You have to call `save` on every instance you just anonymized on your own.

## Installation
Add this line to your application's Gemfile if you want to use it with Rails 5.2 or higher:
```ruby
gem 'anonymizer_rails'
```

If you want to use it with a lower version of Rails 5 or 4 (Rails 4 only supported from 4.2 onwards),
just add this to your Gemfile:
```ruby
gem "anonymizer_rails", git: "https://github.com/ikuseiGmbH/anonymizer_rails", branch: "rails-4"
```

Then execute:
```bash
$ bundle install
```

Or install it yourself with:
```bash
$ gem install anonymizer_rails
```

## Contributing
TBC

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
