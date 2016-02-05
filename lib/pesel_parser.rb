require_relative 'pesel_inspector'
require_relative 'string'
require_relative 'fixnum'
require_relative 'p_parser'
# Core file
module PeselParser
  def self.root
    File.dirname __dir__
  end
end
