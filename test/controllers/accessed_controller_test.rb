require 'test_helper'

class AccessedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accessed_index_url
    assert_response :success
  end

end
