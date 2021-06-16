require 'test_helper'

class StorageServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_service = storage_services(:one)
  end

  test "should get index" do
    get storage_services_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_service_url
    assert_response :success
  end

  test "should create storage_service" do
    assert_difference('StorageService.count') do
      post storage_services_url, params: { storage_service: { storage_service_name: @storage_service.storage_service_name, storage_service_setting_id: @storage_service.storage_service_setting_id } }
    end

    assert_redirected_to storage_service_url(StorageService.last)
  end

  test "should show storage_service" do
    get storage_service_url(@storage_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_service_url(@storage_service)
    assert_response :success
  end

  test "should update storage_service" do
    patch storage_service_url(@storage_service), params: { storage_service: { storage_service_name: @storage_service.storage_service_name, storage_service_setting_id: @storage_service.storage_service_setting_id } }
    assert_redirected_to storage_service_url(@storage_service)
  end

  test "should destroy storage_service" do
    assert_difference('StorageService.count', -1) do
      delete storage_service_url(@storage_service)
    end

    assert_redirected_to storage_services_url
  end
end
