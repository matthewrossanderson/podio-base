require 'spec_helper'

describe "GET /", :type=>:request do
    it "should show the welcome page to new users" do
      visit root_path
      page.should have_content("Welcome")
    end
end

describe "GET /auth/podio", :vcr, :type=>:request do
    it "should sign in through podio (mocked)" do
      visit "/auth/podio"
      page.should have_content("Signed in!")
    end
end
