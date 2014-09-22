require 'test_helper'


class AuthTest < IntegrationTest

  def setup
    User.create!(username: 'turnt_up_robot', password: '1234abcd')
    visit '/'
  end

  def teardown
    User.destroy_all
  end


  def test_user_can_login
    fill_in 'username', with: 'turnt_up_robot'
    fill_in 'password', with: '1234abcd'
    click_button 'login'
    assert page.has_content? 'hello turnt_up_robot!'
  end

  def test_user_cannot_signup
    refute page.has_content? 'signup'
  end

  def test_user_cannot_login_with_incorrect_credentials
    fill_in 'username', with: 'turnt_up_robot'
    fill_in 'password', with: 'abcd1234'
    click_button 'login'
    assert page.has_content? 'invalid credentials, try again or go away please'
  end

  # should maybe go in test suite for what users can access/do?
  def test_user_can_logout_after_logging_in
    fill_in 'username', with: 'turnt_up_robot'
    fill_in 'password', with: '1234abcd'
    click_button 'login'
    assert page.has_content? 'hello'
    click_button 'logout'
    assert page.has_button? 'login'
  end

end