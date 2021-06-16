require "application_system_test_case"

class StorageServiceSettingsTest < ApplicationSystemTestCase
  setup do
    @storage_service_setting = storage_service_settings(:one)
  end

  test "visiting the index" do
    visit storage_service_settings_url
    assert_selector "h1", text: "Storage Service Settings"
  end

  test "creating a Storage service setting" do
    visit storage_service_settings_url
    click_on "New Storage Service Setting"

    fill_in "Amazon storage access key", with: @storage_service_setting.amazon_storage_access_key_id
    fill_in "Amazon storage bucket name", with: @storage_service_setting.amazon_storage_bucket_name
    fill_in "Amazon storage region name", with: @storage_service_setting.amazon_storage_region_name
    fill_in "Amazon storage secret access key", with: @storage_service_setting.amazon_storage_secret_access_key
    fill_in "Amazon storage service name", with: @storage_service_setting.amazon_storage_service_name
    fill_in "Google storage bucket name", with: @storage_service_setting.google_storage_bucket_name
    fill_in "Google storage credentials", with: @storage_service_setting.google_storage_credentials
    fill_in "Google storage project name", with: @storage_service_setting.google_storage_project_name
    fill_in "Google storage service name", with: @storage_service_setting.google_storage_service_name
    fill_in "Local storage root", with: @storage_service_setting.local_storage_root
    fill_in "Local storage service", with: @storage_service_setting.local_storage_service
    fill_in "Microsoft storage access key", with: @storage_service_setting.microsoft_storage_access_key
    fill_in "Microsoft storage account name", with: @storage_service_setting.microsoft_storage_account_name
    fill_in "Microsoft storage container name", with: @storage_service_setting.microsoft_storage_container_name
    fill_in "Microsoft storage service name", with: @storage_service_setting.microsoft_storage_service_name
    fill_in "User", with: @storage_service_setting.user_id
    click_on "Create Storage service setting"

    assert_text "Storage service setting was successfully created"
    click_on "Back"
  end

  test "updating a Storage service setting" do
    visit storage_service_settings_url
    click_on "Edit", match: :first

    fill_in "Amazon storage access key", with: @storage_service_setting.amazon_storage_access_key_id
    fill_in "Amazon storage bucket name", with: @storage_service_setting.amazon_storage_bucket_name
    fill_in "Amazon storage region name", with: @storage_service_setting.amazon_storage_region_name
    fill_in "Amazon storage secret access key", with: @storage_service_setting.amazon_storage_secret_access_key
    fill_in "Amazon storage service name", with: @storage_service_setting.amazon_storage_service_name
    fill_in "Google storage bucket name", with: @storage_service_setting.google_storage_bucket_name
    fill_in "Google storage credentials", with: @storage_service_setting.google_storage_credentials
    fill_in "Google storage project name", with: @storage_service_setting.google_storage_project_name
    fill_in "Google storage service name", with: @storage_service_setting.google_storage_service_name
    fill_in "Local storage root", with: @storage_service_setting.local_storage_root
    fill_in "Local storage service", with: @storage_service_setting.local_storage_service
    fill_in "Microsoft storage access key", with: @storage_service_setting.microsoft_storage_access_key
    fill_in "Microsoft storage account name", with: @storage_service_setting.microsoft_storage_account_name
    fill_in "Microsoft storage container name", with: @storage_service_setting.microsoft_storage_container_name
    fill_in "Microsoft storage service name", with: @storage_service_setting.microsoft_storage_service_name
    fill_in "User", with: @storage_service_setting.user_id
    click_on "Update Storage service setting"

    assert_text "Storage service setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage service setting" do
    visit storage_service_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage service setting was successfully destroyed"
  end
end
