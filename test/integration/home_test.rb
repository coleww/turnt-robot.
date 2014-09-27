require 'test_helper'


class HomeTest < IntegrationTest

  def setup
    logan 'turnt_up_robot', '1234abcd'
  end


  def test_explains_the_thing
    assert page.has_content? 'This is a social network!'
    assert page.has_link? 'Make a new status!', href: '/post'
  end

  def test_shows_current_status
    assert page.has_content? 'Hello World!'
    assert page.has_selector? '.center'
  end

end