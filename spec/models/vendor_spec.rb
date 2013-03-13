require 'spec_helper'

describe Vendor, :vcr=> {:record => :new_episodes}, :type=>:model do

	before(:each) do
		init_podio_client
		@westgate_vendor_id = 11251623
		@zzchang_vendor_id = 11251626
		@pillow_vendor_id = 17115430
		@faribault_vendor_id = 11251566
		@veratex_vendor_id = 11251622
	end

	describe '.new' do

		it 'should initialize' do
			vendor = Vendor.new({ :id => @westgate_vendor_id })
			vendor.should be_a_kind_of(Vendor)
			vendor.id.should_not be_nil
		end

	end	

	describe '.find_by_id' do

		it 'should return a valid Vendor' do
			vendor = Vendor.find_by_id(@westgate_vendor_id)
			vendor.should be_a_kind_of(Vendor)
			vendor.id.should_not be_nil
			vendor.account_name.should == "WESTGATE/HFI"
			vendor.customers.should == "TuesdayMorning.com"
			vendor.contacts.should be_a_kind_of(Array)
			vendor.contacts[0]['phone'].should be_a_kind_of(Array)
			vendor.ecommerce.should be_a_kind_of(Array)
		end

		it 'should return a vendor' do
			vendor = Vendor.find_by_id(11251559)
			puts vendor.products.inspect
		end

		it 'should return an empty vendor when id not found' do
			vendor = Vendor.find_by_id(1)
			vendor.id.should be_nil
			vendor.should be_a_kind_of(Vendor)
		end

		it 'should find related products' do
			vendor = Vendor.find_by_id(@westgate_vendor_id)
			vendor.products.should be_a_kind_of(Array)
			vendor.products.should_not be_empty
		end

		it 'should find related legal items' do
			vendor = Vendor.find_by_id(@pillow_vendor_id)
			# puts vendor.legal_items.collect { |v| v.type}
			vendor.legal_items.should be_a_kind_of(Array)
			vendor.legal_items.should_not be_empty
			vendor.legal_items.should have(4).items
		end

		it 'should have comments' do
			vendor = Vendor.find_by_id(@faribault_vendor_id)
			# puts vendor.comments.inspect
			vendor.comments.should be_a_kind_of(Array)
			vendor.comments.length.should be >= 2
		end

		it 'should return an empty string when field doesnt exist' do
			vendor = Vendor.find_by_id(@westgate_vendor_id)
			pending("determine if this test is needed, then write if necessary")
		end

	end

	describe '.all', :slow do
		it 'should return an array of barebones vendors' do
			vendors = Vendor.all
			vendors.should be_a_kind_of(Array)
			vendors[0].should be_a_kind_of(Vendor)
			vendors[0].id.should_not be_nil
			vendors[0].account_name.should_not be_nil
			vendors[0].hq.should be_nil
			vendors[0].products.should be_nil
		end
	end


	it 'should find related products' do
		refs = Podio::Item.find_references(@westgate_vendor_id)
		products = Vendor.find_products(refs)
		products.should be_a_kind_of(Array)
		products.should_not be_empty
		products[0].should be_a_kind_of(RelatedItem)
	end


end
