require 'spec_helper'
include ModelSpecHelper

describe ProductCertification, :vcr do

	before(:each) do
		init_podio_client
		@sample_product_certification_id = ""
		pending "need a sample id"
		@product_cert = ProductCertification.new(@sample_product_certification_id)
	end

	describe '.new' do

		it 'should initialize' do
			@product_cert.should be_a_kind_of(ProductCertification)
			@product_cert.id.should_not be_nil
		end

		it 'should have required attributes' do
			[:whoisworking].each do |attribute|
				@product_cert.should respond_to(attribute)
			end
		end

	end

end
