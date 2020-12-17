require 'test_helper'

class TaskTimeTrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_time_tracking = task_time_trackings(:one)
  end

  test "should get index" do
    get task_time_trackings_url
    assert_response :success
  end

  test "should get new" do
    get new_task_time_tracking_url
    assert_response :success
  end

  test "should create task_time_tracking" do
    assert_difference('TaskTimeTracking.count') do
      post task_time_trackings_url, params: { task_time_tracking: { end_date: @task_time_tracking.end_date, imputation_item_id: @task_time_tracking.imputation_item_id, start_date: @task_time_tracking.start_date, status: @task_time_tracking.status } }
    end

    assert_redirected_to task_time_tracking_url(TaskTimeTracking.last)
  end

  test "should show task_time_tracking" do
    get task_time_tracking_url(@task_time_tracking)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_time_tracking_url(@task_time_tracking)
    assert_response :success
  end

  test "should update task_time_tracking" do
    patch task_time_tracking_url(@task_time_tracking), params: { task_time_tracking: { end_date: @task_time_tracking.end_date, imputation_item_id: @task_time_tracking.imputation_item_id, start_date: @task_time_tracking.start_date, status: @task_time_tracking.status } }
    assert_redirected_to task_time_tracking_url(@task_time_tracking)
  end

  test "should destroy task_time_tracking" do
    assert_difference('TaskTimeTracking.count', -1) do
      delete task_time_tracking_url(@task_time_tracking)
    end

    assert_redirected_to task_time_trackings_url
  end
end
