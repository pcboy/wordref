# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wordref/version'

Gem::Specification.new do |gem|
  gem.name          = "wordref"
  gem.version       = Wordref::VERSION
  gem.authors       = ["pcboy"]
  gem.email         = ["david.hagege@gmail.com"]
  gem.description   = %q{Tiny gem to translate words with the WordReference API}
  gem.summary       = ""
  gem.homepage      = "https://github.com/pcboy/rtatoeba"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "multi_json", '~> 1.12'
  gem.add_dependency "attempt", '~> 0.3'
  gem.add_dependency "nokogiri", '~> 1.6'
  gem.add_development_dependency "rspec"
end
