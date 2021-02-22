require "application_system_test_case"

class RegisterTypesTest < ApplicationSystemTestCase
  setup do
    @register_type = register_types(:one)
  end

  test "visiting the index" do
    visit register_types_url
    assert_selector "h1", text: "Register Types"
  end

  test "creating a Register type" do
    visit register_types_url
    click_on "New Register Type"

    fill_in "Description", with: @register_type.description
    fill_in "Name", with: @register_type.name
    fill_in "Short name", with: @register_type.short_name
    fill_in "Status", with: @register_type.status
    fill_in "Uid", with: @register_type.uid
    fill_in "User", with: @register_type.user_id
    click_on "Create Register type"

    assert_text "Register type was successfully created"
    click_on "Back"
  end

  test "updating a Register type" do
    visit register_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @register_type.description
    fill_in "Name", with: @register_type.name
    fill_in "Short name", with: @register_type.short_name
    fill_in "Status", with: @register_type.status
    fill_in "Uid", with: @register_type.uid
    fill_in "User", with: @register_type.user_id
    click_on "Update Register type"

    assert_text "Register type was successfully updated"
    click_on "Back"
  end

  test "destroying a Register type" do
    visit register_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Register type was successfully destroyed"
  end
end
