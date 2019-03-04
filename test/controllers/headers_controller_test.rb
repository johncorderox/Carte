require 'test_helper'

class HeadersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get headers_create_url
    assert_response :success
  end

  test "should get delete" do
    get headers_delete_url
    assert_response :success
  end

end
