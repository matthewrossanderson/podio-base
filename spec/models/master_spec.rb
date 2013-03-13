require 'spec_helper'
include ModelSpecHelper

describe Master, :vcr do

	before(:each) do
		init_podio_client
		@sample_master_id = 29084422
		@master = Master.new(@sample_master_id)
	end

	describe '.new' do

		it 'should initialize' do
			@master.should be_a_kind_of(Master)
			@master.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:tasknotes].each do |attribute|
				@master.should respond_to(attribute)
			end
		end

	end

end
