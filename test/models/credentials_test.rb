require 'test_helper'

class UserCredentialsTest < Minitest::Test

  def teardown
    User.destroy_all
  end


  def test_username_length_greater_than_3
    refute User.new({:username => "ag", :password => 'lalala'}).save
  end

  def test_user_needs_password
    refute User.new({:username => "agiles"}).save
  end

  def test_password_length_greater_than_6
    refute User.new({:username => "magiles", :password => "short"}).save
  end

  def test_username_length_less_than_255
    refute User.new({:username => "A" * 256, :password => "Agility"}).save
  end

  def test_password_length_less_than_255
    refute User.new({:username => "Agiles", :password => "Z" * 256}).save
  end

  def test_is_valid_with_good_stuff
    assert_equal true, User.new({:username => "bagiles", :password => "hellaLong"}).save
  end
end
