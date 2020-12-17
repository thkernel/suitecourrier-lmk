require 'test_helper'

class AbilityItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ability_item = ability_items(:one)
  end

  test "should get index" do
    get ability_items_url
    assert_response :success
  end

  test "should get new" do
    get new_ability_item_url
    assert_response :success
  end

  test "should create ability_item" do
    assert_difference('AbilityItem.count') do
      post ability_items_url, params: { ability_item: { ability_id: @ability_item.ability_id, permission_id: @ability_item.permission_id, status: @ability_item.status } }
    end

    assert_redirected_to ability_item_url(AbilityItem.last)
  end

  test "should show ability_item" do
    get ability_item_url(@ability_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_ability_item_url(@ability_item)
    assert_response :success
  end

  test "should update ability_item" do
    patch ability_item_url(@ability_item), params: { ability_item: { ability_id: @ability_item.ability_id, permission_id: @ability_item.permission_id, status: @ability_item.status } }
    assert_redirected_to ability_item_url(@ability_item)
  end

  test "should destroy ability_item" do
    assert_difference('AbilityItem.count', -1) do
      delete ability_item_url(@ability_item)
    end

    assert_redirected_to ability_items_url
  end
end
