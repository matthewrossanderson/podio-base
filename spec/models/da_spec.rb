require 'spec_helper'
include ModelSpecHelper

describe DA, :vcr do

	before(:each) do
		init_podio_client
		@sample_da_id = ""
		pending "need a sample id"
		@da = DA.new(@sample_da_id)
	end

	describe '.new' do

		it 'should initialize' do
			@da.should be_a_kind_of(DA)
			@da.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:tasknotes].each do |attribute|
				@da.should respond_to(attribute)
			end
		end

	end



end
