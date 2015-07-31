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

feature 'Employer can create new job listing' do
  scenario 'Employer fills in form with job details' do
    visit '/jobs/new'
    fill_in 'employer', with: 'Makers Academy'
    fill_in 'role', with: 'Coach'
    fill_in 'description', with: 'Teach people'
    fill_in 'location', with: 'London'
    click_button('Add job')
    expect(current_path).to eq '/'
    expect(page).to have_content 'Makers Academy'
  end
end
