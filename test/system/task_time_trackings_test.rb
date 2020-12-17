require "application_system_test_case"

class TaskTimeTrackingsTest < ApplicationSystemTestCase
  setup do
    @task_time_tracking = task_time_trackings(:one)
  end

  test "visiting the index" do
    visit task_time_trackings_url
    assert_selector "h1", text: "Task Time Trackings"
  end

  test "creating a Task time tracking" do
    visit task_time_trackings_url
    click_on "New Task Time Tracking"

    fill_in "End date", with: @task_time_tracking.end_date
    fill_in "Imputation item", with: @task_time_tracking.imputation_item_id
    fill_in "Start date", with: @task_time_tracking.start_date
    fill_in "Status", with: @task_time_tracking.status
    click_on "Create Task time tracking"

    assert_text "Task time tracking was successfully created"
    click_on "Back"
  end

  test "updating a Task time tracking" do
    visit task_time_trackings_url
    click_on "Edit", match: :first

    fill_in "End date", with: @task_time_tracking.end_date
    fill_in "Imputation item", with: @task_time_tracking.imputation_item_id
    fill_in "Start date", with: @task_time_tracking.start_date
    fill_in "Status", with: @task_time_tracking.status
    click_on "Update Task time tracking"

    assert_text "Task time tracking was successfully updated"
    click_on "Back"
  end

  test "destroying a Task time tracking" do
    visit task_time_trackings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task time tracking was successfully destroyed"
  end
end
