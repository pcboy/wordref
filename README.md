[![Build Status](https://travis-ci.org/pcboy/wordref.svg)](https://travis-ci.org/pcboy/wordref)
[![Gem Version](https://badge.fury.io/rb/wordref.svg)](http://badge.fury.io/rb/wordref)
[![Code Climate](https://codeclimate.com/github/pcboy/wordref/badges/gpa.svg)](https://codeclimate.com/github/pcboy/wordref)

# Wordref

Wordref is a tiny gem to get a translation from Word reference (no API key needed).
You can translate words from one language to another (Note that Wordreference only supports FROM English and TO english translations)

## Installation

Add this line to your application's Gemfile:

    gem 'wordref'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wordref

## Usage

    wr = Wordref::Wordref.new
    
    wr.translate(from: 'en', to: 'fr', word: 'cat') # => "chat"

If you don't give the "from" parameter it'll automatically be set to english.
That's all.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
