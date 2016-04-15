# Code coverage
if ENV['COVERAGE']
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

  SimpleCov.start 'rails'
end
