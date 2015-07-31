require 'sinatra'
require 'json'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/Job_board_app_#{env}")

require './lib/job'

DataMapper.finalize
DataMapper.auto_upgrade!

before do
   content_type :json
   headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

set :protection, false

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
