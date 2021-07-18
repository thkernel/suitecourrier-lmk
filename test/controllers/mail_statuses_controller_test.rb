require 'test_helper'

class MailStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_status = mail_statuses(:one)
  end

  test "should get index" do
    get mail_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_status_url
    assert_response :success
  end

  test "should create mail_status" do
    assert_difference('MailStatus.count') do
      post mail_statuses_url, params: { mail_status: { description: @mail_status.description, name: @mail_status.name, status: @mail_status.status, user_id: @mail_status.user_id } }
    end

    assert_redirected_to mail_status_url(MailStatus.last)
  end

  test "should show mail_status" do
    get mail_status_url(@mail_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_status_url(@mail_status)
    assert_response :success
  end

  test "should update mail_status" do
    patch mail_status_url(@mail_status), params: { mail_status: { description: @mail_status.description, name: @mail_status.name, status: @mail_status.status, user_id: @mail_status.user_id } }
    assert_redirected_to mail_status_url(@mail_status)
  end

  test "should destroy mail_status" do
    assert_difference('MailStatus.count', -1) do
      delete mail_status_url(@mail_status)
    end

    assert_redirected_to mail_statuses_url
  end
end
