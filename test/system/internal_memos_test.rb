require "application_system_test_case"

class InternalMemosTest < ApplicationSystemTestCase
  setup do
    @internal_memo = internal_memos(:one)
  end

  test "visiting the index" do
    visit internal_memos_url
    assert_selector "h1", text: "Internal Memos"
  end

  test "creating a Internal memo" do
    visit internal_memos_url
    click_on "New Internal Memo"

    fill_in "Correspondent", with: @internal_memo.correspondent_id
    fill_in "Folder", with: @internal_memo.folder_id
    fill_in "Mail type", with: @internal_memo.mail_type_id
    fill_in "Priority", with: @internal_memo.priority_id
    fill_in "Status", with: @internal_memo.status
    fill_in "Uid", with: @internal_memo.uid
    fill_in "User", with: @internal_memo.user_id
    click_on "Create Internal memo"

    assert_text "Internal memo was successfully created"
    click_on "Back"
  end

  test "updating a Internal memo" do
    visit internal_memos_url
    click_on "Edit", match: :first

    fill_in "Correspondent", with: @internal_memo.correspondent_id
    fill_in "Folder", with: @internal_memo.folder_id
    fill_in "Mail type", with: @internal_memo.mail_type_id
    fill_in "Priority", with: @internal_memo.priority_id
    fill_in "Status", with: @internal_memo.status
    fill_in "Uid", with: @internal_memo.uid
    fill_in "User", with: @internal_memo.user_id
    click_on "Update Internal memo"

    assert_text "Internal memo was successfully updated"
    click_on "Back"
  end

  test "destroying a Internal memo" do
    visit internal_memos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Internal memo was successfully destroyed"
  end
end
