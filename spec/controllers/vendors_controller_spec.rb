require 'spec_helper'

describe VendorsController, :type => :controller do

	describe 'Recent Vendors' do

		it 'should display 1 recent vendor' do
			pending("")
		end

		it 'should display at most 5 recent vendors' do
			pending("")
		end

		it 'should display the most recent vendor at the front' do
			pending("")
		end

		it 'should not contain nils' do
			pending("")
		end

		it 'should not add if session somehow does not exist' do
			pending("")
		end

	end

	describe 'GET #all' do

		before (:each) do
				mock_session
		end 

		it 'should return json', :slow do

				get :all
				puts session.inspect
				puts response.body
		 		response.should be_success
		end


	end

end

