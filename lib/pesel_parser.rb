require_relative 'pesel_inspector'
# Monkey patch
module PeselParser
  def self.root
    File.dirname __dir__
  end

  def inspect_pesel
    PeselInspector.new(self)
  end
end

String.send(:include, PeselParser)
Fixnum.send(:include, PeselParser)
