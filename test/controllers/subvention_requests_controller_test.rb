require 'test_helper'

class SubventionRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subvention_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get subvention_requests_create_url
    assert_response :success
  end

  test "should get show" do
    get subvention_requests_show_url
    assert_response :success
  end

end
