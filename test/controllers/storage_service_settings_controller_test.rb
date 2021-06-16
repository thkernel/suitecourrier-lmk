require 'test_helper'

class StorageServiceSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_service_setting = storage_service_settings(:one)
  end

  test "should get index" do
    get storage_service_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_service_setting_url
    assert_response :success
  end

  test "should create storage_service_setting" do
    assert_difference('StorageServiceSetting.count') do
      post storage_service_settings_url, params: { storage_service_setting: { amazon_storage_access_key_id: @storage_service_setting.amazon_storage_access_key_id, amazon_storage_bucket_name: @storage_service_setting.amazon_storage_bucket_name, amazon_storage_region_name: @storage_service_setting.amazon_storage_region_name, amazon_storage_secret_access_key: @storage_service_setting.amazon_storage_secret_access_key, amazon_storage_service_name: @storage_service_setting.amazon_storage_service_name, google_storage_bucket_name: @storage_service_setting.google_storage_bucket_name, google_storage_credentials: @storage_service_setting.google_storage_credentials, google_storage_project_name: @storage_service_setting.google_storage_project_name, google_storage_service_name: @storage_service_setting.google_storage_service_name, local_storage_root: @storage_service_setting.local_storage_root, local_storage_service: @storage_service_setting.local_storage_service, microsoft_storage_access_key: @storage_service_setting.microsoft_storage_access_key, microsoft_storage_account_name: @storage_service_setting.microsoft_storage_account_name, microsoft_storage_container_name: @storage_service_setting.microsoft_storage_container_name, microsoft_storage_service_name: @storage_service_setting.microsoft_storage_service_name, user_id: @storage_service_setting.user_id } }
    end

    assert_redirected_to storage_service_setting_url(StorageServiceSetting.last)
  end

  test "should show storage_service_setting" do
    get storage_service_setting_url(@storage_service_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_service_setting_url(@storage_service_setting)
    assert_response :success
  end

  test "should update storage_service_setting" do
    patch storage_service_setting_url(@storage_service_setting), params: { storage_service_setting: { amazon_storage_access_key_id: @storage_service_setting.amazon_storage_access_key_id, amazon_storage_bucket_name: @storage_service_setting.amazon_storage_bucket_name, amazon_storage_region_name: @storage_service_setting.amazon_storage_region_name, amazon_storage_secret_access_key: @storage_service_setting.amazon_storage_secret_access_key, amazon_storage_service_name: @storage_service_setting.amazon_storage_service_name, google_storage_bucket_name: @storage_service_setting.google_storage_bucket_name, google_storage_credentials: @storage_service_setting.google_storage_credentials, google_storage_project_name: @storage_service_setting.google_storage_project_name, google_storage_service_name: @storage_service_setting.google_storage_service_name, local_storage_root: @storage_service_setting.local_storage_root, local_storage_service: @storage_service_setting.local_storage_service, microsoft_storage_access_key: @storage_service_setting.microsoft_storage_access_key, microsoft_storage_account_name: @storage_service_setting.microsoft_storage_account_name, microsoft_storage_container_name: @storage_service_setting.microsoft_storage_container_name, microsoft_storage_service_name: @storage_service_setting.microsoft_storage_service_name, user_id: @storage_service_setting.user_id } }
    assert_redirected_to storage_service_setting_url(@storage_service_setting)
  end

  test "should destroy storage_service_setting" do
    assert_difference('StorageServiceSetting.count', -1) do
      delete storage_service_setting_url(@storage_service_setting)
    end

    assert_redirected_to storage_service_settings_url
  end
end
