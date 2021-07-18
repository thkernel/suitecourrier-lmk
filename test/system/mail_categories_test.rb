require "application_system_test_case"

class MailCategoriesTest < ApplicationSystemTestCase
  setup do
    @mail_category = mail_categories(:one)
  end

  test "visiting the index" do
    visit mail_categories_url
    assert_selector "h1", text: "Mail Categories"
  end

  test "creating a Mail category" do
    visit mail_categories_url
    click_on "New Mail Category"

    fill_in "Description", with: @mail_category.description
    fill_in "Name", with: @mail_category.name
    fill_in "Status", with: @mail_category.status
    fill_in "User", with: @mail_category.user_id
    click_on "Create Mail category"

    assert_text "Mail category was successfully created"
    click_on "Back"
  end

  test "updating a Mail category" do
    visit mail_categories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mail_category.description
    fill_in "Name", with: @mail_category.name
    fill_in "Status", with: @mail_category.status
    fill_in "User", with: @mail_category.user_id
    click_on "Update Mail category"

    assert_text "Mail category was successfully updated"
    click_on "Back"
  end

  test "destroying a Mail category" do
    visit mail_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mail category was successfully destroyed"
  end
end
