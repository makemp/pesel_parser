# frozen_string_literal: true
# Fetch birth date, sex and series number from PESEL number
class PeselInspector
  require 'date'

  PeselError = Class.new(StandardError)

  ERROR_MESSAGE = 'Invalid PESEL'.freeze
  PESEL_LENGTH = 11
  CENTURIES = { '8' => '18', '9' => '18',
                '0' => '19', '1' => '19',
                '2' => '20', '3' => '20',
                '4' => '21', '5' => '21',
                '6' => '22', '7' => '22' }.freeze

  attr_reader :pesel, :birth_date, :sex, :series_number

  def initialize(pes)
    pesel = pes.to_s
    validate(pesel)
    @pesel = pesel
    @birth_date = parse_birth_date
    @sex = pesel[9].to_i.even? ? 'female' : 'male'
    @series_number = pesel[6..9]
  end

  private

  def parse_birth_date
    begin
      date = Date.parse [day, month, year].join('/')
    rescue ArgumentError
      raise PeselError, ERROR_MESSAGE
    end
    date
  end

  def year
    CENTURIES[pesel[2]] + pesel[0..1]
  end

  def day
    pesel[4..5]
  end

  def month
    pesel[2..3].to_i % 20
  end

  # rubocop:disable AbcSize
  def validate(p)
    raise PeselError, ERROR_MESSAGE unless p.size == PESEL_LENGTH
    p = p.split('').map(&:to_i)
    primo   = p[0] + 3 * p[1] + 7 * p[2] + 9 * p[3]
    secondo = p[4] + 3 * p[5] + 7 * p[6] + 9 * p[7] + p[8] + 3 * p[9] + p[10]
    raise PeselError, ERROR_MESSAGE unless (primo + secondo) % 10 == 0
  end
  # rubocop:enable AbcSize
end
