require "application_system_test_case"

class UserEntitiesTest < ApplicationSystemTestCase
  setup do
    @user_entity = user_entities(:one)
  end

  test "visiting the index" do
    visit user_entities_url
    assert_selector "h1", text: "User Entities"
  end

  test "creating a User entity" do
    visit user_entities_url
    click_on "New User Entity"

    fill_in "Status", with: @user_entity.status
    fill_in "User", with: @user_entity.user_id
    click_on "Create User entity"

    assert_text "User entity was successfully created"
    click_on "Back"
  end

  test "updating a User entity" do
    visit user_entities_url
    click_on "Edit", match: :first

    fill_in "Status", with: @user_entity.status
    fill_in "User", with: @user_entity.user_id
    click_on "Update User entity"

    assert_text "User entity was successfully updated"
    click_on "Back"
  end

  test "destroying a User entity" do
    visit user_entities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User entity was successfully destroyed"
  end
end
