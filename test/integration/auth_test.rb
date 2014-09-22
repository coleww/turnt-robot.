require 'test_helper'


class AuthTest < IntegrationTest

  def test_root_has_login
    visit '/'
    assert page.has_content?("login")
  end

end