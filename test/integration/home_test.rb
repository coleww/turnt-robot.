require 'test_helper'


class HomeTest < IntegrationTest

  def setup
    logan 'turnt_up_robot', '1234abcd'
  end


  def test_explains_the_thing
    assert_equal true, (page.has_content? 'This is an ephemeral text-based social network')
  end

  def test_shows_current_status
    assert_equal true, (page.has_selector? '.status')
  end

end