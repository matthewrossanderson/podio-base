require 'spec_helper'
include ModelSpecHelper

describe Image, :vcr do

	before(:each) do
		init_podio_client
		@sample_image_id = 11670625
		@image = Image.new(@sample_image_id)
	end

	describe '.new' do

		it 'should initialize' do
			@image.should be_a_kind_of(Image)
			@image.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:whoisworking].each do |attribute|
				@image.should respond_to(attribute)
			end
		end

	end

end
