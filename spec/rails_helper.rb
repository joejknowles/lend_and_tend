# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rails'
require_relative './users_helper'
Capybara.default_wait_time = 3
# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  #Added to provide images for homepage
  # config.before do |example|

  # end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    # Seeds database with hompage images
    load("#{Rails.root}/db/seeds.rb")
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:suite) do
    # set geocoder to test version of lookup to avoid asynchronous calls
    Geocoder.configure(lookup: :test)
    Geocoder::Lookup::Test.add_stub(
      "YO10 3DD", [
        {
          'latitude'     => 53.95503009999999,
          'longitude'    => -1.0405632
        }
      ]
    )
    Geocoder::Lookup::Test.add_stub(
      'EC4M 8AD', [
        {
          'latitude'     => 51.5072,
          'longitude'    => 0.1275
        }
      ]
    )
    Geocoder::Lookup::Test.add_stub(
      'EH11 2AB', [
        {
          'latitude'     => 53.95503009999999,
          'longitude'    => -1.0405632
        }
      ]
    )
    Geocoder::Lookup::Test.add_stub(
      'SW11 4AE', [
        {
          'latitude'     => 51.5072,
          'longitude'    => 0.1275
        }
      ]
    )
    Geocoder::Lookup::Test.add_stub(
      'London', [
        {
          'latitude'     => 51.5072,
          'longitude'    => 0.1275
        }
      ]
    )
    Geocoder::Lookup::Test.add_stub(
      '6l gs nodhu pt a', [
        {
          'latitude'     => nil,
          'longitude'    => nil
        }
      ]
    )
  end
  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end
