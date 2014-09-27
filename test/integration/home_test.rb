require 'test_helper'


class HomeTest < IntegrationTest

  def setup
    logan 'turnt_up_robot', '1234abcd'
  end


  def test_explains_the_thing
    assert_equal true, (page.has_content? 'This is a social network!')
    assert_equal true, (page.has_link? 'Make a new status!', href: '/status')
  end

  def test_shows_current_status
    assert_equal true, (page.has_selector? '.status')
  end

end