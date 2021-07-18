require 'test_helper'

class MailPrioritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_priority = mail_priorities(:one)
  end

  test "should get index" do
    get mail_priorities_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_priority_url
    assert_response :success
  end

  test "should create mail_priority" do
    assert_difference('MailPriority.count') do
      post mail_priorities_url, params: { mail_priority: { description: @mail_priority.description, name: @mail_priority.name, status: @mail_priority.status, user_id: @mail_priority.user_id } }
    end

    assert_redirected_to mail_priority_url(MailPriority.last)
  end

  test "should show mail_priority" do
    get mail_priority_url(@mail_priority)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_priority_url(@mail_priority)
    assert_response :success
  end

  test "should update mail_priority" do
    patch mail_priority_url(@mail_priority), params: { mail_priority: { description: @mail_priority.description, name: @mail_priority.name, status: @mail_priority.status, user_id: @mail_priority.user_id } }
    assert_redirected_to mail_priority_url(@mail_priority)
  end

  test "should destroy mail_priority" do
    assert_difference('MailPriority.count', -1) do
      delete mail_priority_url(@mail_priority)
    end

    assert_redirected_to mail_priorities_url
  end
end
