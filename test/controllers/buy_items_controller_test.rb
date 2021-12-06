require 'test_helper'

class BuyItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buy_items_index_url
    assert_response :success
  end

  test "should get show" do
    get buy_items_show_url
    assert_response :success
  end

end
