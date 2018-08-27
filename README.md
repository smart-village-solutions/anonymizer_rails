# AnonymizerRails
Sometimes it is necessary to scramble user_data in a clean and fast way.
AnonymizerRails provides the Functionality to do this. AnonymizerRails is a small gem  for Rails
4.2 and higher, to anonymize attributes of an ActiveRecord Model. It doesn't matter if the attribute
is a serialized_hash or an ActiveRecord:Store, you can anonymize any attribute/key no matter how deep
it is nested. The attributes values are replaced with a string of 6 x's

```
"xxxxxx"
```
Anonymization for associated models' attributes will be implemented in a future version
of the gem.

## Usage
The Anonymizer gem adds two methods to Your Active Record Models:
data_to_anonymize is a class method.
It is used to configure which attributes should be anonymized. In Your model it is called like this:
```ruby
class Foo < ApplicationRecord
  data_to_anonymize :name
end
```
If You want to anonymize more than one attribute you have to wrap the attributes in an Array e.g. like this:
```ruby
class Foo < ApplicationRecord
  serialize :submitted_input
  data_to_anonymize [:name, :age, {submitted_input: { user_location: [:city, :country] }]
end
```

The above code tells the gem that when anonymize_data is called on any instance of Foo it should anonymize
the attributes name, age, submitted_input[:user_location][:city] and submitted_input[:user_location][:country]

anonymize_data is an instance method added to every ActiveRecord instance. When called on a record it
anonymizes the configured attributes.

#### !!!Attention!!!: The anonymize_data method doesn't save the anonymized record to the database.
#### After calling it, You have to call save on every instance you just anonymized.

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
