require 'test_helper'

class UserAuthTest < Minitest::Test
  def test_user_needs_password
    refute User.new({:username => "agiles"}).save
  end

  def test_must_have_long_password
    refute User.new({:username => "magiles", :password => "short"}).save
  end

  def test_is_chill_with_good_stuff
    assert_equal true, User.new({:username => "bagiles", :password => "hellaLong"}).save
  end

  # probably doesn't belong here
  def test_status_defaults_to_hello_world
    user = User.new({:username => "hagiles", :password => "hella_long"})
    user.save
    assert_equal user.status, '<strong>Hello World!</strong>'
  end

  def teardown
    User.destroy_all
  end
end
