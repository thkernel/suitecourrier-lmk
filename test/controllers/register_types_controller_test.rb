require 'test_helper'

class RegisterTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @register_type = register_types(:one)
  end

  test "should get index" do
    get register_types_url
    assert_response :success
  end

  test "should get new" do
    get new_register_type_url
    assert_response :success
  end

  test "should create register_type" do
    assert_difference('RegisterType.count') do
      post register_types_url, params: { register_type: { description: @register_type.description, name: @register_type.name, short_name: @register_type.short_name, status: @register_type.status, uid: @register_type.uid, user_id: @register_type.user_id } }
    end

    assert_redirected_to register_type_url(RegisterType.last)
  end

  test "should show register_type" do
    get register_type_url(@register_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_register_type_url(@register_type)
    assert_response :success
  end

  test "should update register_type" do
    patch register_type_url(@register_type), params: { register_type: { description: @register_type.description, name: @register_type.name, short_name: @register_type.short_name, status: @register_type.status, uid: @register_type.uid, user_id: @register_type.user_id } }
    assert_redirected_to register_type_url(@register_type)
  end

  test "should destroy register_type" do
    assert_difference('RegisterType.count', -1) do
      delete register_type_url(@register_type)
    end

    assert_redirected_to register_types_url
  end
end
