require 'test_helper'

class InternalMemosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internal_memo = internal_memos(:one)
  end

  test "should get index" do
    get internal_memos_url
    assert_response :success
  end

  test "should get new" do
    get new_internal_memo_url
    assert_response :success
  end

  test "should create internal_memo" do
    assert_difference('InternalMemo.count') do
      post internal_memos_url, params: { internal_memo: { correspondent_id: @internal_memo.correspondent_id, folder_id: @internal_memo.folder_id, mail_type_id: @internal_memo.mail_type_id, priority_id: @internal_memo.priority_id, status: @internal_memo.status, uid: @internal_memo.uid, user_id: @internal_memo.user_id } }
    end

    assert_redirected_to internal_memo_url(InternalMemo.last)
  end

  test "should show internal_memo" do
    get internal_memo_url(@internal_memo)
    assert_response :success
  end

  test "should get edit" do
    get edit_internal_memo_url(@internal_memo)
    assert_response :success
  end

  test "should update internal_memo" do
    patch internal_memo_url(@internal_memo), params: { internal_memo: { correspondent_id: @internal_memo.correspondent_id, folder_id: @internal_memo.folder_id, mail_type_id: @internal_memo.mail_type_id, priority_id: @internal_memo.priority_id, status: @internal_memo.status, uid: @internal_memo.uid, user_id: @internal_memo.user_id } }
    assert_redirected_to internal_memo_url(@internal_memo)
  end

  test "should destroy internal_memo" do
    assert_difference('InternalMemo.count', -1) do
      delete internal_memo_url(@internal_memo)
    end

    assert_redirected_to internal_memos_url
  end
end
