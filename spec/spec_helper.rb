$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

require "rspec"
require "law_of_demeter_violator"
require "bourne"

Dir["spec/support/**/*.rb"].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.mock_framework = :mocha
end
