require "application_system_test_case"

class TicketUsersTest < ApplicationSystemTestCase
  setup do
    @ticket_user = ticket_users(:one)
  end

  test "visiting the index" do
    visit ticket_users_url
    assert_selector "h1", text: "Ticket Users"
  end

  test "creating a Ticket user" do
    visit ticket_users_url
    click_on "New Ticket User"

    fill_in "Recipient", with: @ticket_user.recipient_id
    fill_in "Ticket", with: @ticket_user.ticket_id
    fill_in "Uid", with: @ticket_user.uid
    click_on "Create Ticket user"

    assert_text "Ticket user was successfully created"
    click_on "Back"
  end

  test "updating a Ticket user" do
    visit ticket_users_url
    click_on "Edit", match: :first

    fill_in "Recipient", with: @ticket_user.recipient_id
    fill_in "Ticket", with: @ticket_user.ticket_id
    fill_in "Uid", with: @ticket_user.uid
    click_on "Update Ticket user"

    assert_text "Ticket user was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket user" do
    visit ticket_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket user was successfully destroyed"
  end
end
