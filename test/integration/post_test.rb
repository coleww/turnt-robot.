require 'test_helper'


class PostTest < IntegrationTest

# perhaps i should just stub current_user here to return...whatever...
  def setup
    logan 'turnt_up_robot', '1234abcd'
  end

  def teardown
    click_button 'logout'
  end


  def test_post_page
    # fill in form
    # run it
    # verify stuff goes in place
    # post it
    # verify it is on index, first
  end

  def test_character_counter
  end

  def test_disallows_blank_submission
  end

  def test_disallows_submission_over_1024
  end

end