require 'spec_helper'
include ModelSpecHelper

describe Product, :vcr do

	before(:each) do
		init_podio_client
		@westgate_product_id = 11596533
		@amain_product_id = 11536332
		@product = Product.new(@westgate_product_id)
	end

	describe '.new' do

		it 'should initialize' do
			# puts @product.inspect
			@product.should be_a_kind_of(Product)
			@product.id.should_not be_nil
			@product.type.should_not be_nil
			@product.name.should_not == ""
			@product.sheets.should_not be_nil
			@product.comforters.should_not == ""
			@product.covers.should_not be_nil
			@product.pillowsandpads.should_not be_nil
			@product.accentpillows.should_not be_nil
			@product.whoisworking.should_not be_nil
			@product.status.should_not == ""
			@product.tasknotes.should_not == ""		
			@product.related_items.should have(3).items
			@product.comments.length.should be <= 4

		end

		it 'should have required attributes' do
			[:sheets, :comforters, :covers, :pillowsandpads, :accentpillows, :whoisworking, :comments].each do |attribute|
				@product.should respond_to(attribute)
			end
		end

	end


end
