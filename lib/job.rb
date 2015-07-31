class Job
  include DataMapper::Resource

  property :id, Serial
  property :employer, String
  property :role, String
  property :description, String
  property :location, String

end