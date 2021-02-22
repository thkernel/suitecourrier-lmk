require "application_system_test_case"

class UserEntityItemsTest < ApplicationSystemTestCase
  setup do
    @user_entity_item = user_entity_items(:one)
  end

  test "visiting the index" do
    visit user_entity_items_url
    assert_selector "h1", text: "User Entity Items"
  end

  test "creating a User entity item" do
    visit user_entity_items_url
    click_on "New User Entity Item"

    fill_in "Entity", with: @user_entity_item.entity_id
    fill_in "Status", with: @user_entity_item.status
    fill_in "User entity", with: @user_entity_item.user_entity_id
    click_on "Create User entity item"

    assert_text "User entity item was successfully created"
    click_on "Back"
  end

  test "updating a User entity item" do
    visit user_entity_items_url
    click_on "Edit", match: :first

    fill_in "Entity", with: @user_entity_item.entity_id
    fill_in "Status", with: @user_entity_item.status
    fill_in "User entity", with: @user_entity_item.user_entity_id
    click_on "Update User entity item"

    assert_text "User entity item was successfully updated"
    click_on "Back"
  end

  test "destroying a User entity item" do
    visit user_entity_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User entity item was successfully destroyed"
  end
end
