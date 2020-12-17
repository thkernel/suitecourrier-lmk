require 'test_helper'

class RequestImputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_imputation = request_imputations(:one)
  end

  test "should get index" do
    get request_imputations_url
    assert_response :success
  end

  test "should get new" do
    get new_request_imputation_url
    assert_response :success
  end

  test "should create request_imputation" do
    assert_difference('RequestImputation.count') do
      post request_imputations_url, params: { request_imputation: { receiver_id: @request_imputation.receiver_id, request_id: @request_imputation.request_id, service_id: @request_imputation.service_id, status: @request_imputation.status, user_id: @request_imputation.user_id } }
    end

    assert_redirected_to request_imputation_url(RequestImputation.last)
  end

  test "should show request_imputation" do
    get request_imputation_url(@request_imputation)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_imputation_url(@request_imputation)
    assert_response :success
  end

  test "should update request_imputation" do
    patch request_imputation_url(@request_imputation), params: { request_imputation: { receiver_id: @request_imputation.receiver_id, request_id: @request_imputation.request_id, service_id: @request_imputation.service_id, status: @request_imputation.status, user_id: @request_imputation.user_id } }
    assert_redirected_to request_imputation_url(@request_imputation)
  end

  test "should destroy request_imputation" do
    assert_difference('RequestImputation.count', -1) do
      delete request_imputation_url(@request_imputation)
    end

    assert_redirected_to request_imputations_url
  end
end
