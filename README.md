# pesel_parser
Parses PESEL number. Validates PESEL, fetches birth date, sex and series number.
Adds monkey patch for String and Fixnum objects -> ```inspect_pesel```

## Installation

Add this line to your application's Gemfile:

```ruby
  gem 'pesel_parser'
```

And then execute:

    $ bundle

## Usage

```ruby
  # Fixnum
  16211813887.inspect_pesel   # => PeselInspector object

  # String
  '16211813887'.inspect_pesel # => PeselInspector object

  # classic way
  PeselInspector.new(16211813887)   # => PeselInspector object
  # or
  PeselInspector.new('16211813887') # => PeselInspector object
```

### PeselInspector object attr_readers
 - pesel (String)
 - sex (male or female, String)
 - series number (String)
 - birth_date (Date)

### Example

  ```ruby
    '16211813887'.inspect_pesel
   # =>
   # #<PeselInspector:0x00000004fefef8
   # @birth_date=#<Date: 2016-01-18 ((2457406j,0s,0n),+0s,2299161j)>,
   # @pesel="16211813887",
   # @series_number="1388",
   # @sex="female">

  ```
