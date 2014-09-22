require 'test_helper'
require "capybara/rails"

class UserAuthTest < Minitest::Test

  include Capybara::DSL

  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end

  def test_root_has_login
    visit '/'
    assert page.has_content?("login")
  end

end