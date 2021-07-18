require 'test_helper'

class MailCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_category = mail_categories(:one)
  end

  test "should get index" do
    get mail_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_category_url
    assert_response :success
  end

  test "should create mail_category" do
    assert_difference('MailCategory.count') do
      post mail_categories_url, params: { mail_category: { description: @mail_category.description, name: @mail_category.name, status: @mail_category.status, user_id: @mail_category.user_id } }
    end

    assert_redirected_to mail_category_url(MailCategory.last)
  end

  test "should show mail_category" do
    get mail_category_url(@mail_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_category_url(@mail_category)
    assert_response :success
  end

  test "should update mail_category" do
    patch mail_category_url(@mail_category), params: { mail_category: { description: @mail_category.description, name: @mail_category.name, status: @mail_category.status, user_id: @mail_category.user_id } }
    assert_redirected_to mail_category_url(@mail_category)
  end

  test "should destroy mail_category" do
    assert_difference('MailCategory.count', -1) do
      delete mail_category_url(@mail_category)
    end

    assert_redirected_to mail_categories_url
  end
end
