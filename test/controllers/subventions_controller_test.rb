require 'test_helper'

class SubventionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subventions_index_url
    assert_response :success
  end

end
