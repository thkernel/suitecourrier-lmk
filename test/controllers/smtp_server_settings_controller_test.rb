require 'test_helper'

class SmtpServerSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smtp_server_setting = smtp_server_settings(:one)
  end

  test "should get index" do
    get smtp_server_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_smtp_server_setting_url
    assert_response :success
  end

  test "should create smtp_server_setting" do
    assert_difference('SmtpServerSetting.count') do
      post smtp_server_settings_url, params: { smtp_server_setting: { authentication: @smtp_server_setting.authentication, authentication_method: @smtp_server_setting.authentication_method, delivery_method: @smtp_server_setting.delivery_method, domain: @smtp_server_setting.domain, enable_starttls_auto: @smtp_server_setting.enable_starttls_auto, host: @smtp_server_setting.host, password: @smtp_server_setting.password, port: @smtp_server_setting.port, sending_address: @smtp_server_setting.sending_address, ssl: @smtp_server_setting.ssl, user_id: @smtp_server_setting.user_id, user_name: @smtp_server_setting.user_name } }
    end

    assert_redirected_to smtp_server_setting_url(SmtpServerSetting.last)
  end

  test "should show smtp_server_setting" do
    get smtp_server_setting_url(@smtp_server_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_smtp_server_setting_url(@smtp_server_setting)
    assert_response :success
  end

  test "should update smtp_server_setting" do
    patch smtp_server_setting_url(@smtp_server_setting), params: { smtp_server_setting: { authentication: @smtp_server_setting.authentication, authentication_method: @smtp_server_setting.authentication_method, delivery_method: @smtp_server_setting.delivery_method, domain: @smtp_server_setting.domain, enable_starttls_auto: @smtp_server_setting.enable_starttls_auto, host: @smtp_server_setting.host, password: @smtp_server_setting.password, port: @smtp_server_setting.port, sending_address: @smtp_server_setting.sending_address, ssl: @smtp_server_setting.ssl, user_id: @smtp_server_setting.user_id, user_name: @smtp_server_setting.user_name } }
    assert_redirected_to smtp_server_setting_url(@smtp_server_setting)
  end

  test "should destroy smtp_server_setting" do
    assert_difference('SmtpServerSetting.count', -1) do
      delete smtp_server_setting_url(@smtp_server_setting)
    end

    assert_redirected_to smtp_server_settings_url
  end
end
