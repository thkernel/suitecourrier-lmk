require "application_system_test_case"

class MailTypesTest < ApplicationSystemTestCase
  setup do
    @mail_type = mail_types(:one)
  end

  test "visiting the index" do
    visit mail_types_url
    assert_selector "h1", text: "Mail Types"
  end

  test "creating a Mail type" do
    visit mail_types_url
    click_on "New Mail Type"

    fill_in "Description", with: @mail_type.description
    fill_in "Name", with: @mail_type.name
    fill_in "Status", with: @mail_type.status
    fill_in "User", with: @mail_type.user_id
    click_on "Create Mail type"

    assert_text "Mail type was successfully created"
    click_on "Back"
  end

  test "updating a Mail type" do
    visit mail_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mail_type.description
    fill_in "Name", with: @mail_type.name
    fill_in "Status", with: @mail_type.status
    fill_in "User", with: @mail_type.user_id
    click_on "Update Mail type"

    assert_text "Mail type was successfully updated"
    click_on "Back"
  end

  test "destroying a Mail type" do
    visit mail_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mail type was successfully destroyed"
  end
end
