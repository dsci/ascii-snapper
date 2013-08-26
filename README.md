# Ascii::Snapper

Converts encoding of ASCII-8BIT POST data to UTF-8.

## Installation

Add this line to your application's Gemfile:

    gem 'ascii-snapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ascii-snapper

## Usage

If you're using Rails, that's it. You haven't to do anything more. If you're not using Rails, you will have to add to your config.ru:

```
require 'ascii-snapper'

use AsciiSnapper::Middleware
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
