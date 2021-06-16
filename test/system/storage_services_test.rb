require "application_system_test_case"

class StorageServicesTest < ApplicationSystemTestCase
  setup do
    @storage_service = storage_services(:one)
  end

  test "visiting the index" do
    visit storage_services_url
    assert_selector "h1", text: "Storage Services"
  end

  test "creating a Storage service" do
    visit storage_services_url
    click_on "New Storage Service"

    fill_in "Storage service name", with: @storage_service.storage_service_name
    fill_in "Storage service setting", with: @storage_service.storage_service_setting_id
    click_on "Create Storage service"

    assert_text "Storage service was successfully created"
    click_on "Back"
  end

  test "updating a Storage service" do
    visit storage_services_url
    click_on "Edit", match: :first

    fill_in "Storage service name", with: @storage_service.storage_service_name
    fill_in "Storage service setting", with: @storage_service.storage_service_setting_id
    click_on "Update Storage service"

    assert_text "Storage service was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage service" do
    visit storage_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage service was successfully destroyed"
  end
end
