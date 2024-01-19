require "test_helper"

class Public::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_order_details_index_url
    assert_response :success
  end

  test "should get show" do
    get public_order_details_show_url
    assert_response :success
  end
end
