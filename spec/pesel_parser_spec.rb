require 'spec_helper'

describe PeselParser do
  specify do
    expect(16_211_813_887.inspect_pesel).to be_a(PeselInspector)
  end

  specify do
    expect('16211813887'.inspect_pesel).to be_a(PeselInspector)
  end
end
