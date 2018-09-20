[![Gem](https://img.shields.io/gem/v/memair.svg?style=flat)](http://rubygems.org/gems/memair)
[![License](http://img.shields.io/badge/license-MIT-yellow.svg?style=flat)](https://github.com/memair/memair-ruby-sdk/blob/master/LICENSE)
[![Gregology](https://img.shields.io/badge/contact-Gregology-blue.svg?style=flat)](http://gregology.net/contact/)
[![Downloads](https://img.shields.io/gem/dt/memair.svg?style=flat)](http://rubygems.org/gems/memair)

# Memair

SDK for simple interaction with the Memair APIs

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'memair'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install memair

## Example
```  ruby
>> require 'memair'
=> True


>> require 'memair'
=> true
>> access_token = "0" * 64 # Otto is Memair's sandbox user
=> "0000000000000000000000000000000000000000000000000000000000000000"
>> user = Memair.new(access_token)
=> #<Memair:0x00007f8a3fa657e0 @access_token="0000000000000000000000000000000000000000000000000000000000000000">
>> query = """
    query get_user_details {
        UserDetails {
            email
        }
    }
"""
=> "\nquery get_user_details {\n  UserDetails {\n    email\n  }\n}\n"
>>  response = user.query(query)
=> {"data"=>{"UserDetails"=>[{"email"=>"otto@memair.com"}]}}
```
