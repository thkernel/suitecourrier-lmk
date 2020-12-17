require "application_system_test_case"

class RequestImputationsTest < ApplicationSystemTestCase
  setup do
    @request_imputation = request_imputations(:one)
  end

  test "visiting the index" do
    visit request_imputations_url
    assert_selector "h1", text: "Request Imputations"
  end

  test "creating a Request imputation" do
    visit request_imputations_url
    click_on "New Request Imputation"

    fill_in "Receiver", with: @request_imputation.receiver_id
    fill_in "Request", with: @request_imputation.request_id
    fill_in "Service", with: @request_imputation.service_id
    fill_in "Status", with: @request_imputation.status
    fill_in "User", with: @request_imputation.user_id
    click_on "Create Request imputation"

    assert_text "Request imputation was successfully created"
    click_on "Back"
  end

  test "updating a Request imputation" do
    visit request_imputations_url
    click_on "Edit", match: :first

    fill_in "Receiver", with: @request_imputation.receiver_id
    fill_in "Request", with: @request_imputation.request_id
    fill_in "Service", with: @request_imputation.service_id
    fill_in "Status", with: @request_imputation.status
    fill_in "User", with: @request_imputation.user_id
    click_on "Update Request imputation"

    assert_text "Request imputation was successfully updated"
    click_on "Back"
  end

  test "destroying a Request imputation" do
    visit request_imputations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request imputation was successfully destroyed"
  end
end
