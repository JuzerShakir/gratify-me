require "test_helper"

class SaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get says_new_url
    assert_response :success
  end
end
