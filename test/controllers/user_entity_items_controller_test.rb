require 'test_helper'

class UserEntityItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_entity_item = user_entity_items(:one)
  end

  test "should get index" do
    get user_entity_items_url
    assert_response :success
  end

  test "should get new" do
    get new_user_entity_item_url
    assert_response :success
  end

  test "should create user_entity_item" do
    assert_difference('UserEntityItem.count') do
      post user_entity_items_url, params: { user_entity_item: { entity_id: @user_entity_item.entity_id, status: @user_entity_item.status, user_entity_id: @user_entity_item.user_entity_id } }
    end

    assert_redirected_to user_entity_item_url(UserEntityItem.last)
  end

  test "should show user_entity_item" do
    get user_entity_item_url(@user_entity_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_entity_item_url(@user_entity_item)
    assert_response :success
  end

  test "should update user_entity_item" do
    patch user_entity_item_url(@user_entity_item), params: { user_entity_item: { entity_id: @user_entity_item.entity_id, status: @user_entity_item.status, user_entity_id: @user_entity_item.user_entity_id } }
    assert_redirected_to user_entity_item_url(@user_entity_item)
  end

  test "should destroy user_entity_item" do
    assert_difference('UserEntityItem.count', -1) do
      delete user_entity_item_url(@user_entity_item)
    end

    assert_redirected_to user_entity_items_url
  end
end
