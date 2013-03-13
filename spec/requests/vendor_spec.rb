require 'spec_helper'


describe 'the search page', :vcr => {:record => :new_episodes } do
		before(:each) do
		login_with_oauth
		@westgate_vendor_id = 11251623
		@vendor = FactoryGirl.build(:vendor)
		visit '/vendors'
	end

	it 'displays vendors', :broken do
		page.should have_selector('#vendors .vendor')
	end

	it 'has a search element' do
		page.should have_selector("#vendor-search")
	end
end

describe 'the vendor detail page', :vcr => {:record => :new_episodes } do
	
	before(:each) do
		login_with_oauth
		@westgate_vendor_id = 11251623
		@vendor = FactoryGirl.build(:vendor)
	end

	it 'exists' do
		visit "/vendors/#{@vendor.id}"
		page.should have_content("")
	end

	it 'displays the vendor details' do
		visit "/vendors/#{@vendor.id}"
		page.should have_content("Contacts")
		page.should have_content("#{@vendor.account_name}")

	end

	it 'displays an error when not found' do
		visit "/vendors/0" 
		page.should have_content("Vendor not found.")
	end

	it 'has a print button' do
		visit "/vendors/#{@vendor.id}"
		page.should have_content("Print View")	
	end

	it 'has related items' do
		visit "/vendors/#{@vendor.id}"
		page.should have_css("h4", :text => "Data")
		page.should have_css("h4", :text => "Cost / Inventory")
		page.should have_css("h4", :text => "Swatches")
		page.should have_css("h4", :text => "Images")
	end

	it 'the great vendor test', :focus, :slow do
		visit "/vendors/all"
		all = JSON.parse(page.body)
		page.status_code.should == 200
		all.each do |vendor|
			puts vendor["id"]
			visit "/vendors/#{vendor["id"]}"
			page.status_code.should == 200
		end

	end

end

describe 'the vendor cache updater' do

	it 'should return 200' do
		visit '/vendors/update'
		page.status_code.should be 200
	end

end

describe 'the vendor print view page', :vcr => {:record => :new_episodes } do
	
	before(:each) do
		login_with_oauth
		@westgate_vendor_id = 11251623
		@vendor = FactoryGirl.build(:vendor)
		visit "/vendors/#{@westgate_vendor_id}/print"
	end

	it 'displays the vendor details' do
		page.should have_content("Contacts")
		page.should have_content("#{@vendor.account_name}")
	end

end