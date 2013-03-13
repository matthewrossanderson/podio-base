require 'spec_helper'
include ModelSpecHelper

describe Sample, :vcr do

	before(:each) do
		init_podio_client
		@westgate_sample_id = 27697523
		@sample = Sample.new(@westgate_sample_id)
	end

	describe '.new' do

		it 'should initialize' do
			@sample.should be_a_kind_of(Sample)
			@sample.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:whoisworking].each do |attribute|
				@sample.should respond_to(attribute)
			end
		end

	end

end
