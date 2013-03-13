require 'spec_helper'

describe App do

	before(:each) do
		@data_app_id = 1769503
		@name = "Data"
	end

  it 'should find_by_id' do
		@app = App.find_by_id(@data_app_id)
		@app.id.should_not be_nil
	end
	
	it 'should find_by_name' do
		@app = App.find_by_name(@name)
		@app.id.should_not be_nil
	end

	it 'should find_by_lowercase_name' do
		@app = App.find_by_lowercase_name(@name.downcase)
		@app.name.should_not be_nil
	end

end
