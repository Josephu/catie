# Catie

This gem provides standard serialize data helpers.

## Installation

Add this line to your application's Gemfile:

    gem 'catie'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install catie

## Usage

Assume you have a table with serialize text column call "data"

	create_table :dummies do |t|
		t.text :data
	end

To use this, in your active record model, add:

	class Dummy < ActiveRecord::Base
		include Catie
		serialize_attributes(:data,:foo,:bar)
	end

Where "data" is the column name and "foo" and "bar" is the attribute to store as serialize data.

Now, you can use

	@dummy = Dummy.new
	@dummy.foo = "a"
	@dummy.foo   
		=> "a"
	@dummy.bar = 1
	@dummy.bar   
		=> 1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
