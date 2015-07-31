require 'spec_helper'

describe 'API' do
  it 'serves all the data in json format' do
    get '/api/jobs'
    last_response.should be_ok
  end

  it 'serves individual entries in json format' do
    get '/api/jobs/:id', params={id: 0}
    last_response.should be_ok
  end

  it 'Should accept data in json format' do
    expect(Job.count).to eq(0)
    post '/api/jobs', {:employer => 'Employer', :role => 'Role', :description => 'Description', :location => 'Location'}
    expect(Job.count).to eq(1)
    expect(Job.first.employer).to eq('Employer')
  end
end