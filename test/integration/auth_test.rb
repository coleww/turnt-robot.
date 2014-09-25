require 'test_helper'


class AuthTest < IntegrationTest

  def test_user_cannot_signup
    visit '/'
    refute page.has_content? 'signup'
  end

  def test_auth_required_on_index_page
    visit '/all'
    assert page.has_content? 'You must login first'
    assert page.has_content? 'login'
  end

  def test_auth_required_on_post_page
    visit '/new'
    assert page.has_content? 'login'
  end

  def test_user_can_login_and_logout
    logan 'turnt_up_robot', '1234abcd'
    assert page.has_content? 'hello turnt_up_robot!'
    click_button 'logout'
    assert page.has_button? 'login'
  end

  def test_user_cannot_login_with_incorrect_credentials
    logan 'turnt_up_robot', 'abcd1234'
    assert page.has_content? 'invalid credentials, try again or go away please'
  end

end