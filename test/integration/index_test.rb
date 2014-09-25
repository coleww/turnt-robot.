require 'test_helper'


class IndexTest < IntegrationTest

  def setup
    logan 'turnt_up_robot', '1234abcd'
  end

  def teardown
    click_button 'logout'
  end

  def test_index
    # make some users w/ posts, 1 > the page
    # verify that the stuff is there
    # verif
  end

end