require 'test_helper'


class AuthTest < IntegrationTest

  def setup
    User.create! username: 'turnt_up_robot', password: '1234abcd'
  end

  def teardown
    (User.find_by_username 'turnt_up_robot').destroy
  end


  def test_user_can_login
    logan 'turnt_up_robot', '1234abcd'
    assert page.has_content? 'hello turnt_up_robot!'
  end

  def test_user_cannot_signup
    refute page.has_content? 'signup'
  end

  def test_user_cannot_login_with_incorrect_credentials
    logan 'turnt_up_robot', 'abcd1234'
    assert page.has_content? 'invalid credentials, try again or go away please'
  end

  # should maybe go in test suite for what users can access/do?
  def test_user_can_logout_after_logging_in
    logan 'turnt_up_robot', '1234abcd'
    assert page.has_content? 'hello'
    click_button 'logout'
    assert page.has_button? 'login'
  end

end