require 'test_helper'


class PostTest < IntegrationTest

# perhaps i should just stub current_user here to return...whatever...
  def setup
    logan 'turnt_up_robot', '1234abcd'
    visit '/status'
  end

  def teardown
    click_button 'logout'
  end


  def test_post_page
    fill_in :status, with: '<span class="red">test STATUS YO!</span>'
    click_button 'update status'
    assert_equal true, (page.has_selector? '.red')
    assert_equal true, (page.has_content? 'test STATUS YO!')
  end

  def test_truncates_if_greater_than_1024
    fill_in :status, with: 'a' * 1025
    click_button 'update status'
    assert_equal true, (page.has_content? 'a' * 1024)
    assert_equal false, (page.has_content? 'a' * 1025)
  end

  def test_shows_available_classes
    assert_equal true, (page.has_content? 'Available classes for yr sick spans!')
  end

end