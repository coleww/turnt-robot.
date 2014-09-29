require 'test_helper'

class UserTest < Minitest::Test

  def setup
    @user = User.create! username: "agiles", password: "hella_long"
  end

  def teardown
    (User.find_by_username 'agiles').destroy
  end

  def test_username_must_be_unique
    refute (User.new username: "agiles", password: "hella_long").save
  end

  def test_status_defaults_to_hello_world
    assert_equal @user.status, '<span class="center">Hello World!</span>'
  end

  def test_status_limited_to_1024
    @user.status = 'a' * 1030
    @user.save!
    assert_equal @user.status, 'a' * 1024
  end

  def test_status_allows_spans_and_classes
    @user.status = '<span class="center">Hello Internet!</span>'
    @user.save!
    @user.reload
    assert_equal @user.status, '<span class="center">Hello Internet!</span>'
  end

  def test_status_allows_only_spans_and_classes
    @user.status = '<script>alert(Hello World!);</script><style>background-color: red;</style><strong><center>HAXXORED!</strong></center>'
    @user.save!
    @user.reload
    assert_equal @user.status, 'alert(Hello World!);background-color: red;HAXXORED!'
  end

end
