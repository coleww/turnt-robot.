ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)

require "minitest/autorun"
require "minitest/pride"
require "capybara/rails"


class IntegrationTest < Minitest::Test
  include Capybara::DSL
  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end

def logan uname, password
  visit '/'
  fill_in 'username', with: uname
  fill_in 'password', with: password
  click_button 'login'
end