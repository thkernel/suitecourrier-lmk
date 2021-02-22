require "application_system_test_case"

class StorageAreasTest < ApplicationSystemTestCase
  setup do
    @storage_area = storage_areas(:one)
  end

  test "visiting the index" do
    visit storage_areas_url
    assert_selector "h1", text: "Storage Areas"
  end

  test "creating a Storage area" do
    visit storage_areas_url
    click_on "New Storage Area"

    fill_in "Description", with: @storage_area.description
    fill_in "Maximum size", with: @storage_area.maximum_size
    fill_in "Name", with: @storage_area.name
    fill_in "Path", with: @storage_area.path
    fill_in "Short name", with: @storage_area.short_name
    fill_in "Status", with: @storage_area.status
    fill_in "Uid", with: @storage_area.uid
    fill_in "User", with: @storage_area.user_id
    click_on "Create Storage area"

    assert_text "Storage area was successfully created"
    click_on "Back"
  end

  test "updating a Storage area" do
    visit storage_areas_url
    click_on "Edit", match: :first

    fill_in "Description", with: @storage_area.description
    fill_in "Maximum size", with: @storage_area.maximum_size
    fill_in "Name", with: @storage_area.name
    fill_in "Path", with: @storage_area.path
    fill_in "Short name", with: @storage_area.short_name
    fill_in "Status", with: @storage_area.status
    fill_in "Uid", with: @storage_area.uid
    fill_in "User", with: @storage_area.user_id
    click_on "Update Storage area"

    assert_text "Storage area was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage area" do
    visit storage_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage area was successfully destroyed"
  end
end
