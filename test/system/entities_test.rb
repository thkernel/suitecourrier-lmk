require "application_system_test_case"

class EntitiesTest < ApplicationSystemTestCase
  setup do
    @entity = entities(:one)
  end

  test "visiting the index" do
    visit entities_url
    assert_selector "h1", text: "Entities"
  end

  test "creating a Entity" do
    visit entities_url
    click_on "New Entity"

    fill_in "Address", with: @entity.address
    fill_in "Description", with: @entity.description
    fill_in "Email", with: @entity.email
    fill_in "Entity type", with: @entity.entity_type_id
    fill_in "Name", with: @entity.name
    fill_in "Parent entity", with: @entity.parent_entity_id
    fill_in "Phone", with: @entity.phone
    fill_in "Short name", with: @entity.short_name
    fill_in "Status", with: @entity.status
    fill_in "Uid", with: @entity.uid
    fill_in "User", with: @entity.user_id
    click_on "Create Entity"

    assert_text "Entity was successfully created"
    click_on "Back"
  end

  test "updating a Entity" do
    visit entities_url
    click_on "Edit", match: :first

    fill_in "Address", with: @entity.address
    fill_in "Description", with: @entity.description
    fill_in "Email", with: @entity.email
    fill_in "Entity type", with: @entity.entity_type_id
    fill_in "Name", with: @entity.name
    fill_in "Parent entity", with: @entity.parent_entity_id
    fill_in "Phone", with: @entity.phone
    fill_in "Short name", with: @entity.short_name
    fill_in "Status", with: @entity.status
    fill_in "Uid", with: @entity.uid
    fill_in "User", with: @entity.user_id
    click_on "Update Entity"

    assert_text "Entity was successfully updated"
    click_on "Back"
  end

  test "destroying a Entity" do
    visit entities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entity was successfully destroyed"
  end
end
