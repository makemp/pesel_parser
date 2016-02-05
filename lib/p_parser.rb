# common monkey patch
module PParser
  def inspect_pesel
    PeselInspector.new(self)
  end
end
