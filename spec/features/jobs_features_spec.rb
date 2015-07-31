# require 'spec_helper'

feature 'User browses the list of jobs' do
  before(:each) do
    Job.create(employer: "Employer", role: "Role", description: "Description", location: "Location")
  end
  
  scenario 'User can view jobs posted by employers' do 
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Employer Role Description Location"
  end
end