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

  get '/jobs/new' do
    erb :'jobs/new'
  end

  post '/jobs' do
    Job.create(employer: params[:employer],role: params[:role],description: params[:description],location: params[:location])
    redirect to('/')
  end
