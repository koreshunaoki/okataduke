require 'test_helper'

class Item::SellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_sells_index_url
    assert_response :success
  end

  test "should get new" do
    get item_sells_new_url
    assert_response :success
  end

  test "should get show" do
    get item_sells_show_url
    assert_response :success
  end

  test "should get edit" do
    get item_sells_edit_url
    assert_response :success
  end

  test "should get complete" do
    get item_sells_complete_url
    assert_response :success
  end

end
