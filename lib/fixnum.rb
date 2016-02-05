require_relative 'p_parser'
# monkey patch
class Fixnum
  include ::PParser
end
