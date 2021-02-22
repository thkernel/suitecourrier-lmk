require "application_system_test_case"

class EntityTypesTest < ApplicationSystemTestCase
  setup do
    @entity_type = entity_types(:one)
  end

  test "visiting the index" do
    visit entity_types_url
    assert_selector "h1", text: "Entity Types"
  end

  test "creating a Entity type" do
    visit entity_types_url
    click_on "New Entity Type"

    fill_in "Description", with: @entity_type.description
    fill_in "Name", with: @entity_type.name
    fill_in "Status", with: @entity_type.status
    fill_in "Uid", with: @entity_type.uid
    fill_in "User", with: @entity_type.user_id
    click_on "Create Entity type"

    assert_text "Entity type was successfully created"
    click_on "Back"
  end

  test "updating a Entity type" do
    visit entity_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @entity_type.description
    fill_in "Name", with: @entity_type.name
    fill_in "Status", with: @entity_type.status
    fill_in "Uid", with: @entity_type.uid
    fill_in "User", with: @entity_type.user_id
    click_on "Update Entity type"

    assert_text "Entity type was successfully updated"
    click_on "Back"
  end

  test "destroying a Entity type" do
    visit entity_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entity type was successfully destroyed"
  end
end
