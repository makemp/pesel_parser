# coding: utf-8
# rubocop:disable all
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pesel_parser'

Gem::Specification.new do |spec|
  spec.name          = 'pesel_parser'
  spec.version       = '0.0.1'
  spec.authors       = ['Maciej Kempin']

  spec.summary       = %(Parses PESEL number. Validates PESEL, fetches birth date, sex and series number)
  spec.license       = 'MIT'

  spec.files         = %w(lib/pesel_parser.rb lib/pesel_inspector.rb)
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '-> 0.37.0'
end
# rubocop:enable all
