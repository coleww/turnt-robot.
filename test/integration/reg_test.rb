require 'test_helper'


class RegTest < IntegrationTest

  def test_user_can_signup_with_a_reg_token
    Reg.create token: 'balderdash'

    visit '/register'
    fill_in 'username', with: 'test_bro'
    fill_in 'password', with: 'lala1234'
    fill_in 'token', with: 'balderdash'
    click_button 'register'
    assert page.has_content? 'hello test_bro!'
    (User.find_by_username 'test_bro').destroy
  end

  def test_user_cannot_signup_without_a_reg_token
    visit '/register'
    fill_in 'username', with: 'test_bro'
    fill_in 'password', with: 'lala1234'
    fill_in 'token', with: 'nonononono'
    click_button 'register'
    refute page.has_content? 'hello test_bro!'
    assert page.has_content? 'invalid credentials, try again or go away please'
  end

end