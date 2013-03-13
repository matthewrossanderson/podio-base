require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
    ENV["RAILS_ENV"] ||= 'test'
    require File.expand_path("../../config/environment", __FILE__)
    require 'rspec/rails'
    require 'capybara/rspec'
    require 'vcr'

    
    # Requires supporting ruby files with custom matchers and macros, etc,
    # in spec/support/ and its subdirectories.
    Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

    # Rake Seed Test Database
    load "#{Rails.root}/db/seeds.rb"

    RSpec.configure do |config|
      config.mock_with :rspec
      config.include Capybara::DSL
      config.include IntegrationSpecHelper, :type=> :request
      config.include ModelSpecHelper, :type => :model
      config.include ControllerSpecHelper, :type=> :controller
      config.use_transactional_fixtures = true
      config.treat_symbols_as_metadata_keys_with_true_values = true
      config.filter_run :focus => true
      config.filter_run_excluding :slow => true
      config.filter_run_excluding :broken => true
      config.run_all_when_everything_filtered = true
      config.include ShowMeTheCookies, :type=>:feature
    end

    Capybara.configure do |config|
      config.default_host = "http://sheetsdashboard.dev"
    end

    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:podio, OmniAuth::AuthHash.new({
      :credentials => { 
        :token => ENV['PODIO_ACCESS_TOKEN'],
        :refresh_token => ENV['PODIO_REFRESH_TOKEN']
      },
      :info => { :user_id => ENV['PODIO_USER_ID'] }
    }))

    VCR.configure do |c|
      c.cassette_library_dir = 'spec/cassettes'
      c.default_cassette_options = { :record => :new_episodes }
      c.hook_into :webmock
      c.configure_rspec_metadata!
      c.allow_http_connections_when_no_cassette = true
      c.debug_logger = File.open('spec/cassettes/vcr.log','w')
    end


end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
end

# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.
