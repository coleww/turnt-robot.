require 'test_helper'


class IndexTest < IntegrationTest

  def setup
    logan 'turnt_up_robot', '1234abcd'
  end

  def teardown
    click_button 'logout'
  end

  def test_index_pagination
    13.times {|i| User.create username: "bob#{i}", password: 'geegosh', status: 'test!' }
    visit '/'
    # something is
    assert page.has_content? User.order("last_post desc").first.username
    # not right
    refute page.has_content? User.order("last_post desc").last.username
    click_link 'older'
    # here, wat.
    assert page.has_content? User.order("last_post desc").last.username
  end

end