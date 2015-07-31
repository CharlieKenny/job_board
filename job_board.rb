require 'sinatra'
require 'json'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/Job_board_app_#{env}")

require './lib/job'

DataMapper.finalize
DataMapper.auto_upgrade!

before do
   headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
            'Access-Control-Allow-Headers' => 'Content-Type'
end

set :protection, false

  get '/api/jobs' do
    jobs = Job.all
    jobs.to_json
  end

  get '/api/jobs/:id' do
    job = Job.get(params[:id])
    job.to_json
  end

  post '/api/jobs' do
    job = Job.new
    job.employer = params[:employer]
    job.role = params[:role]
    job.description = params[:description]
    job.location = params[:location]
    job.save
  end

