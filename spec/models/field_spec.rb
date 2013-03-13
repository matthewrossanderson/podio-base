require 'spec_helper'

describe Field do

	before(:each) do
		@data_status_field_id = 13445362
		@app_name = "Cost / Inventory"
		@field_name = "Who is working on this?"
	end

  it 'should find_by_id' do
		@field = Field.find_by_id(@data_status_field_id)
		@field.id.should_not be_nil
	end
	
	it 'should find_by_name' do
		@field = Field.find_by_name(@field_name)
		@field.id.should_not be_nil
		# puts @field.inspect
	end

	it 'should find_by_lowercase_name' do
		@field = Field.find_by_lowercase_name(@field_name)
		@field.name.should_not be_nil
	end

	it 'should find_by_app_name_and_field_name' do
		@field = Field.find_by_app_name_field_name(@app_name, @field_name)
		# puts @field.inspect
	end
end
