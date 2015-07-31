ENV['RACK_ENV'] = 'test'
require './job_board'
require 'rack/test'
require 'database_cleaner'

RSpec.configure do |config|
  config.include Rack::Test::Methods
 config.before(:suite) do
   DatabaseCleaner.strategy = :transaction
   DatabaseCleaner.clean_with(:truncation)
 end

 config.before(:each) do
   DatabaseCleaner.start
 end

 config.after(:each) do
   DatabaseCleaner.clean
 end
end

require 'capybara/rspec'
Capybara.app = Sinatra::Application

def app
 Sinatra::Application 
end