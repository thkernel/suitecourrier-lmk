require "application_system_test_case"

class MailPrioritiesTest < ApplicationSystemTestCase
  setup do
    @mail_priority = mail_priorities(:one)
  end

  test "visiting the index" do
    visit mail_priorities_url
    assert_selector "h1", text: "Mail Priorities"
  end

  test "creating a Mail priority" do
    visit mail_priorities_url
    click_on "New Mail Priority"

    fill_in "Description", with: @mail_priority.description
    fill_in "Name", with: @mail_priority.name
    fill_in "Status", with: @mail_priority.status
    fill_in "User", with: @mail_priority.user_id
    click_on "Create Mail priority"

    assert_text "Mail priority was successfully created"
    click_on "Back"
  end

  test "updating a Mail priority" do
    visit mail_priorities_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mail_priority.description
    fill_in "Name", with: @mail_priority.name
    fill_in "Status", with: @mail_priority.status
    fill_in "User", with: @mail_priority.user_id
    click_on "Update Mail priority"

    assert_text "Mail priority was successfully updated"
    click_on "Back"
  end

  test "destroying a Mail priority" do
    visit mail_priorities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mail priority was successfully destroyed"
  end
end
