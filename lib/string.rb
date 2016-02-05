require_relative 'p_parser'
# monkey patch
class String
  include ::PParser
end
