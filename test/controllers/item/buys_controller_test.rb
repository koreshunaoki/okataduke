require 'test_helper'

class Item::BuysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_buys_index_url
    assert_response :success
  end

  test "should get show" do
    get item_buys_show_url
    assert_response :success
  end

end
