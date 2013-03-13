require 'spec_helper'
include ModelSpecHelper

describe SLA, :vcr do

	before(:each) do
		init_podio_client
		@sample_sla_id = ""
		pending "need a sample id"
		@sla = SLA.new(@sample_sla_id)
	end

	describe '.new' do

		it 'should initialize' do
			@sla.should be_a_kind_of(SLA)
			@sla.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:tasknotes].each do |attribute|
				@sla.should respond_to(attribute)
			end
		end

	end

end
