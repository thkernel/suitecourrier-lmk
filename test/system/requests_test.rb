require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test "visiting the index" do
    visit requests_url
    assert_selector "h1", text: "Requests"
  end

  test "creating a Request" do
    visit requests_url
    click_on "New Request"

    fill_in "Academic year", with: @request.academic_year
    fill_in "Born date", with: @request.born_date
    fill_in "Born place", with: @request.born_place
    fill_in "Description", with: @request.description
    fill_in "First name", with: @request.first_name
    fill_in "Gender", with: @request.gender
    fill_in "Grade", with: @request.grade
    fill_in "Last name", with: @request.last_name
    fill_in "Request date", with: @request.request_date
    fill_in "Request type", with: @request.request_type_id
    fill_in "Specialty", with: @request.specialty
    fill_in "Status", with: @request.status
    fill_in "User", with: @request.user_id
    click_on "Create Request"

    assert_text "Request was successfully created"
    click_on "Back"
  end

  test "updating a Request" do
    visit requests_url
    click_on "Edit", match: :first

    fill_in "Academic year", with: @request.academic_year
    fill_in "Born date", with: @request.born_date
    fill_in "Born place", with: @request.born_place
    fill_in "Description", with: @request.description
    fill_in "First name", with: @request.first_name
    fill_in "Gender", with: @request.gender
    fill_in "Grade", with: @request.grade
    fill_in "Last name", with: @request.last_name
    fill_in "Request date", with: @request.request_date
    fill_in "Request type", with: @request.request_type_id
    fill_in "Specialty", with: @request.specialty
    fill_in "Status", with: @request.status
    fill_in "User", with: @request.user_id
    click_on "Update Request"

    assert_text "Request was successfully updated"
    click_on "Back"
  end

  test "destroying a Request" do
    visit requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request was successfully destroyed"
  end
end
