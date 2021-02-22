require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity = entities(:one)
  end

  test "should get index" do
    get entities_url
    assert_response :success
  end

  test "should get new" do
    get new_entity_url
    assert_response :success
  end

  test "should create entity" do
    assert_difference('Entity.count') do
      post entities_url, params: { entity: { address: @entity.address, description: @entity.description, email: @entity.email, entity_type_id: @entity.entity_type_id, name: @entity.name, parent_entity_id: @entity.parent_entity_id, phone: @entity.phone, short_name: @entity.short_name, status: @entity.status, uid: @entity.uid, user_id: @entity.user_id } }
    end

    assert_redirected_to entity_url(Entity.last)
  end

  test "should show entity" do
    get entity_url(@entity)
    assert_response :success
  end

  test "should get edit" do
    get edit_entity_url(@entity)
    assert_response :success
  end

  test "should update entity" do
    patch entity_url(@entity), params: { entity: { address: @entity.address, description: @entity.description, email: @entity.email, entity_type_id: @entity.entity_type_id, name: @entity.name, parent_entity_id: @entity.parent_entity_id, phone: @entity.phone, short_name: @entity.short_name, status: @entity.status, uid: @entity.uid, user_id: @entity.user_id } }
    assert_redirected_to entity_url(@entity)
  end

  test "should destroy entity" do
    assert_difference('Entity.count', -1) do
      delete entity_url(@entity)
    end

    assert_redirected_to entities_url
  end
end
