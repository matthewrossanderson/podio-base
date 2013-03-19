class App < ActiveRecord::Base
  belongs_to :workspace
  has_many :fields
  attr_accessible :id, :name, :meets_spec

  def verify
  	# get the podio app
  	# loop through the associated fields
  	# if required, check for presence in podio app
  	# if not found, return meets_spec=false
  	# at the end of method,
  	# return meets_spec = true

  	podio_app = Podio::Application.find(self.id)

  	self.fields.each do |field|
  		if field.required
  			found = podio_app.fields.find { |podio_field| podio_field["field_id"] == field.id } 
  			unless found
  				self.meets_spec = false
  				self.save
  				return self.meets_spec
  			end
  		end
  	end
  	self.meets_spec = true
  	self.save
  	return self.meets_spec
  end
end
