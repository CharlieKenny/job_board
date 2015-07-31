require 'sinatra'

require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/Job_board_app_#{env}")

require './lib/job'

DataMapper.finalize
DataMapper.auto_upgrade!

  get '/' do
    @jobs = Job.all
    erb :index
  end
