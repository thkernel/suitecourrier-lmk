require 'test_helper'

class RequestImputationTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_imputation_task = request_imputation_tasks(:one)
  end

  test "should get index" do
    get request_imputation_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_request_imputation_task_url
    assert_response :success
  end

  test "should create request_imputation_task" do
    assert_difference('RequestImputationTask.count') do
      post request_imputation_tasks_url, params: { request_imputation_task: { closing_date: @request_imputation_task.closing_date, description: @request_imputation_task.description, end_date: @request_imputation_task.end_date, request_imputation_id: @request_imputation_task.request_imputation_id, start_date: @request_imputation_task.start_date, task_status_id: @request_imputation_task.task_status_id, task_type_id: @request_imputation_task.task_type_id, title: @request_imputation_task.title, user_id: @request_imputation_task.user_id } }
    end

    assert_redirected_to request_imputation_task_url(RequestImputationTask.last)
  end

  test "should show request_imputation_task" do
    get request_imputation_task_url(@request_imputation_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_imputation_task_url(@request_imputation_task)
    assert_response :success
  end

  test "should update request_imputation_task" do
    patch request_imputation_task_url(@request_imputation_task), params: { request_imputation_task: { closing_date: @request_imputation_task.closing_date, description: @request_imputation_task.description, end_date: @request_imputation_task.end_date, request_imputation_id: @request_imputation_task.request_imputation_id, start_date: @request_imputation_task.start_date, task_status_id: @request_imputation_task.task_status_id, task_type_id: @request_imputation_task.task_type_id, title: @request_imputation_task.title, user_id: @request_imputation_task.user_id } }
    assert_redirected_to request_imputation_task_url(@request_imputation_task)
  end

  test "should destroy request_imputation_task" do
    assert_difference('RequestImputationTask.count', -1) do
      delete request_imputation_task_url(@request_imputation_task)
    end

    assert_redirected_to request_imputation_tasks_url
  end
end
