# Wordref

Wordref is a tiny wrapper for the WordReference API.
You can translate words from one language to another.

## Installation

Add this line to your application's Gemfile:

    gem 'wordref'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wordref

## Usage

    wr = Wordref::Wordref.new('your_api_key')
    
    wr.translate(from: 'en', to: 'fr', 'cat') # => "chat"

That's all.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
