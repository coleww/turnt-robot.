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