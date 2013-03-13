require 'spec_helper'
include ModelSpecHelper

describe Swatch, :vcr do

	before(:each) do
		init_podio_client
		@westgate_swatch_id = 11790123
		@swatch = Swatch.new(@westgate_swatch_id)
	end

	describe '.new' do

		it 'should initialize' do
			@swatch.should be_a_kind_of(Swatch)
			@swatch.id.should_not be_nil
			@swatch.location.should_not == ""
			@swatch.whoisworking.should_not == ""
		end

		it 'should have required attributes' do
			[:location, :whoisworking].each do |attribute|
				@swatch.should respond_to(attribute)
			end
		end

	end

end
