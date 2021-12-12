require 'test_helper'

class Item::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_homes_index_url
    assert_response :success
  end

  test "should get new" do
    get item_homes_new_url
    assert_response :success
  end

  test "should get show" do
    get item_homes_show_url
    assert_response :success
  end

  test "should get edit" do
    get item_homes_edit_url
    assert_response :success
  end

end
