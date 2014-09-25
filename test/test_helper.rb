ENV["RAILS_ENV"] = "test"

require 'simplecov'
SimpleCov.start

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

User.create! username: 'turnt_up_robot', password: '1234abcd'

Minitest.after_run { (u = User.find_by_username 'turnt_up_robot') ? u.destroy : false }
