require "application_system_test_case"

class RequestTypesTest < ApplicationSystemTestCase
  setup do
    @request_type = request_types(:one)
  end

  test "visiting the index" do
    visit request_types_url
    assert_selector "h1", text: "Request Types"
  end

  test "creating a Request type" do
    visit request_types_url
    click_on "New Request Type"

    fill_in "Description", with: @request_type.description
    fill_in "Name", with: @request_type.name
    fill_in "Status", with: @request_type.status
    fill_in "User", with: @request_type.user_id
    click_on "Create Request type"

    assert_text "Request type was successfully created"
    click_on "Back"
  end

  test "updating a Request type" do
    visit request_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @request_type.description
    fill_in "Name", with: @request_type.name
    fill_in "Status", with: @request_type.status
    fill_in "User", with: @request_type.user_id
    click_on "Update Request type"

    assert_text "Request type was successfully updated"
    click_on "Back"
  end

  test "destroying a Request type" do
    visit request_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request type was successfully destroyed"
  end
end
