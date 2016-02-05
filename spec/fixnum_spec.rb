require 'spec_helper'

describe Fixnum do
  specify do
    expect(16_211_813_887.inspect_pesel).to be_a(PeselInspector)
  end
end
