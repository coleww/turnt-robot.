require 'test_helper'

class UserAuthTest < Minitest::Test
  def test_user_needs_password
    refute User.new({:email => "Agiles@example.com"}).save, "user must have a password"
  end

  def test_must_have_long_password
    refute User.new({:email => "agiles@example.com", :password => "short"}).save, "user must have password.length >= 6"
  end

  def test_is_chill_with_good_stuff
    assert User.create({:email => "agiles@example.com", :password => "hella_long"}), "user is accepted with email and password"
  end
end
