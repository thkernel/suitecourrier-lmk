require 'test_helper'

class StorageAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_area = storage_areas(:one)
  end

  test "should get index" do
    get storage_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_area_url
    assert_response :success
  end

  test "should create storage_area" do
    assert_difference('StorageArea.count') do
      post storage_areas_url, params: { storage_area: { description: @storage_area.description, maximum_size: @storage_area.maximum_size, name: @storage_area.name, path: @storage_area.path, short_name: @storage_area.short_name, status: @storage_area.status, uid: @storage_area.uid, user_id: @storage_area.user_id } }
    end

    assert_redirected_to storage_area_url(StorageArea.last)
  end

  test "should show storage_area" do
    get storage_area_url(@storage_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_area_url(@storage_area)
    assert_response :success
  end

  test "should update storage_area" do
    patch storage_area_url(@storage_area), params: { storage_area: { description: @storage_area.description, maximum_size: @storage_area.maximum_size, name: @storage_area.name, path: @storage_area.path, short_name: @storage_area.short_name, status: @storage_area.status, uid: @storage_area.uid, user_id: @storage_area.user_id } }
    assert_redirected_to storage_area_url(@storage_area)
  end

  test "should destroy storage_area" do
    assert_difference('StorageArea.count', -1) do
      delete storage_area_url(@storage_area)
    end

    assert_redirected_to storage_areas_url
  end
end
