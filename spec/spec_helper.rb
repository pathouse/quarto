$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

begin
  # use `bundle install --standalone' to get this...
  require_relative '../bundle/bundler/setup'
rescue LoadError
  # fall back to regular bundler if the developer hasn't bundled standalone
  require 'bundler'
  Bundler.setup
end

require 'rspec/given'
require 'construct'

RSpec.configure do |config|
  config.include Construct::Helpers

  config.around :each do |example|
    within_construct do |c|
      @construct = c
      example.run
    end
  end
end
