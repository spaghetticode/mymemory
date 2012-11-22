# Mymemory

[![Build Status](https://secure.travis-ci.org/spaghetticode/mymemory.png)](http://travis-ci.org/spaghetticode/mymemory)

A (very) basic wrapper on mymemory.com translation resful API. See the
[mymemory website](http://mymemory.translated.net/doc/spec.php) for usage
constraints.


## Installation

Add this line to your application's Gemfile:
```bash
  gem 'mymemory'
```

And then execute:
```bash
  $ bundle
```

Or install it yourself as:
```bash
  gem install mymemory
```


## Usage
```ruby
  text = 'a rose for Emily'
  Mymemory.translate(text, :from => :en, :to => :it)
  # => 'una rosa per Emily'
```
The ```from => :en``` key is optional as long as the original language is english.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
