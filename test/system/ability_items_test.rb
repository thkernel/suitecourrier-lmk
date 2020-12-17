require "application_system_test_case"

class AbilityItemsTest < ApplicationSystemTestCase
  setup do
    @ability_item = ability_items(:one)
  end

  test "visiting the index" do
    visit ability_items_url
    assert_selector "h1", text: "Ability Items"
  end

  test "creating a Ability item" do
    visit ability_items_url
    click_on "New Ability Item"

    fill_in "Ability", with: @ability_item.ability_id
    fill_in "Permission", with: @ability_item.permission_id
    fill_in "Status", with: @ability_item.status
    click_on "Create Ability item"

    assert_text "Ability item was successfully created"
    click_on "Back"
  end

  test "updating a Ability item" do
    visit ability_items_url
    click_on "Edit", match: :first

    fill_in "Ability", with: @ability_item.ability_id
    fill_in "Permission", with: @ability_item.permission_id
    fill_in "Status", with: @ability_item.status
    click_on "Update Ability item"

    assert_text "Ability item was successfully updated"
    click_on "Back"
  end

  test "destroying a Ability item" do
    visit ability_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ability item was successfully destroyed"
  end
end
