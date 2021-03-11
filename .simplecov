# Code coverage
if ENV['COVERAGE']
  require 'simplecov-cobertura'
  #SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::CoberturaFormatter,
    Coveralls::SimpleCov::Formatter
  ])

  SimpleCov.start 'rails'
end
