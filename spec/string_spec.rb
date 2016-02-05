require 'spec_helper'

describe String do
  specify do
    expect('16211813887'.inspect_pesel).to be_a(PeselInspector)
  end
end
