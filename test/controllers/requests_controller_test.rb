require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get requests_url
    assert_response :success
  end

  test "should get new" do
    get new_request_url
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post requests_url, params: { request: { academic_year: @request.academic_year, born_date: @request.born_date, born_place: @request.born_place, description: @request.description, first_name: @request.first_name, gender: @request.gender, grade: @request.grade, last_name: @request.last_name, request_date: @request.request_date, request_type_id: @request.request_type_id, specialty: @request.specialty, status: @request.status, user_id: @request.user_id } }
    end

    assert_redirected_to request_url(Request.last)
  end

  test "should show request" do
    get request_url(@request)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_url(@request)
    assert_response :success
  end

  test "should update request" do
    patch request_url(@request), params: { request: { academic_year: @request.academic_year, born_date: @request.born_date, born_place: @request.born_place, description: @request.description, first_name: @request.first_name, gender: @request.gender, grade: @request.grade, last_name: @request.last_name, request_date: @request.request_date, request_type_id: @request.request_type_id, specialty: @request.specialty, status: @request.status, user_id: @request.user_id } }
    assert_redirected_to request_url(@request)
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end

    assert_redirected_to requests_url
  end
end
