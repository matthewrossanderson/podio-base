require 'spec_helper'
include ModelSpecHelper

describe RelatedItem, :vcr do

	before(:each) do
		init_podio_client
		@surya_data_id = 16745679
		@rel = RelatedItem.new(RelatedItem.find_item(@surya_data_id))
		@westgate_costinventory = 19216552
		@westgate_product = 11596533
		@westgate_data_item = 11596533
		@comforters_field_id = 13445364
	end

	describe '.new' do

		it 'should initialize' do
			@rel.should be_a_kind_of(RelatedItem)
		end

		it 'should return an empty class when given an incorrect id', :broken do
			pending "refactor"
			fakerel = RelatedItem.new(RelatedItem.find_item(0))
			fakerel.should be_nil 

		end

		it 'should create a valid class' do
			@rel.id.should_not be_nil
			@rel.type.should_not be_nil
			@rel.status.should_not be_nil

		end

	end

	it 'should return a Podio Item when given an id' do
			@item = RelatedItem.find_item(@westgate_costinventory)
			@item.should be_a_kind_of(Podio::Item)
			@item.should_not be_nil
	end

	describe '.find_status' do
		it 'should return an array' do
			@item = Podio::Item.find(@westgate_costinventory)
			status = @rel.find_status(@item)
			status.should be_a_kind_of(Array)
			status.should_not be_empty
		end
	end

	describe '.find_tasknotes' do
		it 'should return a string' do
			@item = Podio::Item.find(@westgate_costinventory)
			tasknotes = @rel.find_tasknotes(@item)
			tasknotes.should be_a_kind_of(String)
			tasknotes.should_not be_nil
		end
	end

	describe '.find_number_field_by_id' do
		it 'should return an integer' do
			@item = Podio::Item.find(@westgate_product)
			comforters = @rel.find_number_field_by_id(@comforters_field_id, @item)
			comforters.should be_a_kind_of(String)
			comforters.should_not == ""
			puts comforters
		end
	end


	describe '.find_text_field_by_id' do
		it 'should return a string' do
			@item = Podio::Item.find(@westgate_costinventory)
			comforters = @rel.find_text_field_by_id(@comforters_field_id, @item)
			comforters.should be_a_kind_of(String)
			comforters.should_not be_nil
		end

		it 'should return a blank string when not found' do
			@item = Podio::Item.find(@westgate_costinventory)
			responsible = @rel.find_text_field_by_id(@comforters_field_id, @item)
			responsible.should be_a_kind_of(String)
			responsible.should == ""
		end
	end

	it 'should return all attributes meta style' do
		@rel.instance_variables.each do |attribute|
			# puts attribute.to_s << " " << @rel.instance_variable_get(attribute).to_s
		end
	end

	it 'should have comments' do
		# puts @rel.inspect
		@rel.comments.should be_a_kind_of(Array)
		@rel.comments.length.should be <= 4
	end


end
