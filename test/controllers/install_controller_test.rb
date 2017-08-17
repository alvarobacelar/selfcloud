require 'test_helper'

class InstallControllerTest < ActionDispatch::IntegrationTest
  test "should get puppet" do
    get install_puppet_url
    assert_response :success
  end

end
