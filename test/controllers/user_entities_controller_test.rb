require 'test_helper'

class UserEntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_entity = user_entities(:one)
  end

  test "should get index" do
    get user_entities_url
    assert_response :success
  end

  test "should get new" do
    get new_user_entity_url
    assert_response :success
  end

  test "should create user_entity" do
    assert_difference('UserEntity.count') do
      post user_entities_url, params: { user_entity: { status: @user_entity.status, user_id: @user_entity.user_id } }
    end

    assert_redirected_to user_entity_url(UserEntity.last)
  end

  test "should show user_entity" do
    get user_entity_url(@user_entity)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_entity_url(@user_entity)
    assert_response :success
  end

  test "should update user_entity" do
    patch user_entity_url(@user_entity), params: { user_entity: { status: @user_entity.status, user_id: @user_entity.user_id } }
    assert_redirected_to user_entity_url(@user_entity)
  end

  test "should destroy user_entity" do
    assert_difference('UserEntity.count', -1) do
      delete user_entity_url(@user_entity)
    end

    assert_redirected_to user_entities_url
  end
end
