require "application_system_test_case"

class RequestImputationTasksTest < ApplicationSystemTestCase
  setup do
    @request_imputation_task = request_imputation_tasks(:one)
  end

  test "visiting the index" do
    visit request_imputation_tasks_url
    assert_selector "h1", text: "Request Imputation Tasks"
  end

  test "creating a Request imputation task" do
    visit request_imputation_tasks_url
    click_on "New Request Imputation Task"

    fill_in "Closing date", with: @request_imputation_task.closing_date
    fill_in "Description", with: @request_imputation_task.description
    fill_in "End date", with: @request_imputation_task.end_date
    fill_in "Request imputation", with: @request_imputation_task.request_imputation_id
    fill_in "Start date", with: @request_imputation_task.start_date
    fill_in "Task status", with: @request_imputation_task.task_status_id
    fill_in "Task type", with: @request_imputation_task.task_type_id
    fill_in "Title", with: @request_imputation_task.title
    fill_in "User", with: @request_imputation_task.user_id
    click_on "Create Request imputation task"

    assert_text "Request imputation task was successfully created"
    click_on "Back"
  end

  test "updating a Request imputation task" do
    visit request_imputation_tasks_url
    click_on "Edit", match: :first

    fill_in "Closing date", with: @request_imputation_task.closing_date
    fill_in "Description", with: @request_imputation_task.description
    fill_in "End date", with: @request_imputation_task.end_date
    fill_in "Request imputation", with: @request_imputation_task.request_imputation_id
    fill_in "Start date", with: @request_imputation_task.start_date
    fill_in "Task status", with: @request_imputation_task.task_status_id
    fill_in "Task type", with: @request_imputation_task.task_type_id
    fill_in "Title", with: @request_imputation_task.title
    fill_in "User", with: @request_imputation_task.user_id
    click_on "Update Request imputation task"

    assert_text "Request imputation task was successfully updated"
    click_on "Back"
  end

  test "destroying a Request imputation task" do
    visit request_imputation_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request imputation task was successfully destroyed"
  end
end
