require 'spec_helper'
include ModelSpecHelper

describe CostInventory, :vcr do

	before(:each) do
		init_podio_client
		@westgate_costinventory_id = 19216552
		@costinventory = CostInventory.new(@westgate_costinventory_id)
	end

	describe '.new' do

		it 'should initialize' do
			@costinventory.should be_a_kind_of(CostInventory)
			@costinventory.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:whoisworking].each do |attribute|
				@costinventory.should respond_to(attribute)
			end
		end

	end

end
