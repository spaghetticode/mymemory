# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mymemory/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["andrea longhi"]
  gem.email         = ["andrea@spaghetticode.it"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mymemory"
  gem.require_paths = ["lib"]
  gem.version       = Mymemory::VERSION

  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'pry'
end
