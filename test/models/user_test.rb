require 'test_helper'

class UserTest < Minitest::Test

  def setup
    @user = User.create! username: "agiles", password: "hella_long"
  end

  def teardown
    (User.find_by_username 'agiles').destroy
  end


  def test_username_must_be_unique
    refute User.new({:username => "agiles", :password => "hella_long"}).save
  end

  def test_status_defaults_to_hello_world
    assert_equal @user.status, '<strong>Hello World!</strong>'
  end

end
