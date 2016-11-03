require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter::new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
end

SimpleCov.start 'rails'
