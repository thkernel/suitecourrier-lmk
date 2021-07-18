require "application_system_test_case"

class TaskPrioritiesTest < ApplicationSystemTestCase
  setup do
    @task_priority = task_priorities(:one)
  end

  test "visiting the index" do
    visit task_priorities_url
    assert_selector "h1", text: "Task Priorities"
  end

  test "creating a Task priority" do
    visit task_priorities_url
    click_on "New Task Priority"

    fill_in "Color", with: @task_priority.color
    fill_in "Description", with: @task_priority.description
    fill_in "Name", with: @task_priority.name
    fill_in "Processing time in days", with: @task_priority.processing_time_in_days
    fill_in "Uid", with: @task_priority.uid
    fill_in "User", with: @task_priority.user_id
    click_on "Create Task priority"

    assert_text "Task priority was successfully created"
    click_on "Back"
  end

  test "updating a Task priority" do
    visit task_priorities_url
    click_on "Edit", match: :first

    fill_in "Color", with: @task_priority.color
    fill_in "Description", with: @task_priority.description
    fill_in "Name", with: @task_priority.name
    fill_in "Processing time in days", with: @task_priority.processing_time_in_days
    fill_in "Uid", with: @task_priority.uid
    fill_in "User", with: @task_priority.user_id
    click_on "Update Task priority"

    assert_text "Task priority was successfully updated"
    click_on "Back"
  end

  test "destroying a Task priority" do
    visit task_priorities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task priority was successfully destroyed"
  end
end
