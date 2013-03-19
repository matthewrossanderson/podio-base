require 'spec_helper'
include ModelSpecHelper

describe App, :vcr do

	before (:each) do
		init_podio_client
	end

	it 'should pass an app that meets spec' do

		# this field is required for the integration, and exists in the podio app.
  	field = FactoryGirl.create(:required_field)
  	app = App.find(field.app_id)
    app.meets_spec.should be_false
  	app.verify.should be_true
    app.meets_spec.should be_true
	
	end

  it 'should reject a failing app' do

  	# this field doesn't exist in podio, but is set as required.
  	field = FactoryGirl.create(:failing_field)
  	app = App.find(field.app_id)
    app.meets_spec.should be_false
  	app.verify.should be_false
    app.meets_spec.should be_false

 	end

end
