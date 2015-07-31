describe Job do 
  it 'can be create in the db' do
    expect(described_class.count).to eq(0)
    described_class.create(employer: "Employer", role: "Role", description: "Description", location: "Location")
    expect(described_class.count).to eq 1
    job = described_class.first
    expect(job.employer).to eq 'Employer'
    expect(job.role).to eq 'Role'
    expect(job.description).to eq 'Description'
    expect(job.location).to eq 'Location'
    job.destroy
    expect(described_class.count).to eq 0
  end
end