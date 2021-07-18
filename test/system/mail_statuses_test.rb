require "application_system_test_case"

class MailStatusesTest < ApplicationSystemTestCase
  setup do
    @mail_status = mail_statuses(:one)
  end

  test "visiting the index" do
    visit mail_statuses_url
    assert_selector "h1", text: "Mail Statuses"
  end

  test "creating a Mail status" do
    visit mail_statuses_url
    click_on "New Mail Status"

    fill_in "Description", with: @mail_status.description
    fill_in "Name", with: @mail_status.name
    fill_in "Status", with: @mail_status.status
    fill_in "User", with: @mail_status.user_id
    click_on "Create Mail status"

    assert_text "Mail status was successfully created"
    click_on "Back"
  end

  test "updating a Mail status" do
    visit mail_statuses_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mail_status.description
    fill_in "Name", with: @mail_status.name
    fill_in "Status", with: @mail_status.status
    fill_in "User", with: @mail_status.user_id
    click_on "Update Mail status"

    assert_text "Mail status was successfully updated"
    click_on "Back"
  end

  test "destroying a Mail status" do
    visit mail_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mail status was successfully destroyed"
  end
end
