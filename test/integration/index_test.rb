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
    visit 'all'
    assert page.has_content? User.order("updated_at desc")[11].username
    refute page.has_content? User.order("updated_at desc")[12].username
    click_link 'older'
    assert page.has_content? User.order("updated_at desc")[12].username
  end

end