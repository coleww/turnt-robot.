require 'test_helper'

class UserCredentialsTest < Minitest::Test

  def test_username_length_greater_than_3
    refute User.new({:username => "ag", :password => 'lalala'}).valid?
  end

  def test_user_needs_password
    refute User.new({:username => "agiles"}).valid?
  end

  def test_password_length_greater_than_6
    refute User.new({:username => "magiles", :password => "short"}).valid?
  end

  def test_username_length_less_than_255
    refute User.new({:username => "A" * 256, :password => "Agility"}).valid?
  end

  def test_password_length_less_than_255
    refute User.new({:username => "Agiles", :password => "Z" * 256}).valid?
  end

  def test_is_valid_with_good_stuff
    assert_equal true, User.new({:username => "bagiles", :password => "hellaLong"}).valid?
  end

end
