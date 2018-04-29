require 'capybara/rspec'
require 'dish'
require 'dishlist'
require 'dishlist_generator'
require 'order'
require 'orderer'
require 'menu_handler'
require 'message_handler'
require 'simplecov'
require 'simplecov-console'
require 'pry'
require 'pry-byebug'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.full_backtrace = false
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
