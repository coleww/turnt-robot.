require 'test_helper'


class AuthTest < IntegrationTest

  def setup
    visit '/'
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

  def test_user_cannot_login_without_correct_credentials
  end

end