require_relative 'spec_helper'

describe PeselInspector do
  subject(:inspector) { described_class.new(pesel) }

  context 'when pesel from 21 century' do
    let(:pesel) { '16211813887' }

    specify do
      expect(inspector.sex).to eq 'female'
      expect(inspector.pesel).to eq pesel
      expect(inspector.series_number).to eq '1388'
      expect(inspector.birth_date).to eq Date.parse('18/01/2016')
    end
  end

  context 'when pesel from 19 century' do
    let(:pesel) { '19912318352' }

    specify do
      expect(inspector.sex).to eq 'male'
      expect(inspector.pesel).to eq pesel
      expect(inspector.series_number).to eq '1835'
      expect(inspector.birth_date).to eq Date.parse('23/11/1819')
    end
  end

  context 'when pesel is from 20 century' do
    let(:pesel) { '50051502754' }

    specify do
      expect(inspector.sex).to eq 'male'
      expect(inspector.pesel).to eq pesel
      expect(inspector.series_number).to eq '0275'
      expect(inspector.birth_date).to eq Date.parse('15/05/1950')
    end
  end

  context 'when pesel is from 22 century' do
    let(:pesel) { '01410116808' }

    specify do
      expect(inspector.sex).to eq 'female'
      expect(inspector.pesel).to eq pesel
      expect(inspector.series_number).to eq '1680'
      expect(inspector.birth_date).to eq Date.parse('01/01/2101')
    end
  end

  describe 'when pesel is from 23 century' do
    let(:pesel) { '01630303842' }

    specify do
      expect(inspector.sex).to eq 'female'
      expect(inspector.pesel).to eq pesel
      expect(inspector.series_number).to eq '0384'
      expect(inspector.birth_date).to eq Date.parse('03/03/2201')
    end
  end

  context 'when pesel contains date of 30th of Feb' do
    let(:pesel) { '90023002217' }

    specify do
      expect { inspector }.to raise_error PeselInspector::PeselError
    end
  end

  context 'when pesel is longer than expected' do
    let(:pesel) { '900230022173232' }

    specify do
      expect { inspector }.to raise_error PeselInspector::PeselError
    end
  end

  context 'when pesel is shorter than expected' do
    let(:pesel) { '900230022' }

    specify do
      expect { inspector }.to raise_error PeselInspector::PeselError
    end
  end
end
