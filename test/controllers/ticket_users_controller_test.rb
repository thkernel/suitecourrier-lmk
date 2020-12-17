require 'test_helper'

class TicketUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_user = ticket_users(:one)
  end

  test "should get index" do
    get ticket_users_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_user_url
    assert_response :success
  end

  test "should create ticket_user" do
    assert_difference('TicketUser.count') do
      post ticket_users_url, params: { ticket_user: { recipient_id: @ticket_user.recipient_id, ticket_id: @ticket_user.ticket_id, uid: @ticket_user.uid } }
    end

    assert_redirected_to ticket_user_url(TicketUser.last)
  end

  test "should show ticket_user" do
    get ticket_user_url(@ticket_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_user_url(@ticket_user)
    assert_response :success
  end

  test "should update ticket_user" do
    patch ticket_user_url(@ticket_user), params: { ticket_user: { recipient_id: @ticket_user.recipient_id, ticket_id: @ticket_user.ticket_id, uid: @ticket_user.uid } }
    assert_redirected_to ticket_user_url(@ticket_user)
  end

  test "should destroy ticket_user" do
    assert_difference('TicketUser.count', -1) do
      delete ticket_user_url(@ticket_user)
    end

    assert_redirected_to ticket_users_url
  end
end
