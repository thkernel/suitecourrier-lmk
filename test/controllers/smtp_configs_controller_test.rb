require 'test_helper'

class SmtpConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smtp_config = smtp_configs(:one)
  end

  test "should get index" do
    get smtp_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_smtp_config_url
    assert_response :success
  end

  test "should create smtp_config" do
    assert_difference('SmtpConfig.count') do
      post smtp_configs_url, params: { smtp_config: { address: @smtp_config.address, authentification: @smtp_config.authentification, domain: @smtp_config.domain, enable_starttls_auto: @smtp_config.enable_starttls_auto, host: @smtp_config.host, password: @smtp_config.password, port: @smtp_config.port, ssl: @smtp_config.ssl, user_id: @smtp_config.user_id, user_name: @smtp_config.user_name } }
    end

    assert_redirected_to smtp_config_url(SmtpConfig.last)
  end

  test "should show smtp_config" do
    get smtp_config_url(@smtp_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_smtp_config_url(@smtp_config)
    assert_response :success
  end

  test "should update smtp_config" do
    patch smtp_config_url(@smtp_config), params: { smtp_config: { address: @smtp_config.address, authentification: @smtp_config.authentification, domain: @smtp_config.domain, enable_starttls_auto: @smtp_config.enable_starttls_auto, host: @smtp_config.host, password: @smtp_config.password, port: @smtp_config.port, ssl: @smtp_config.ssl, user_id: @smtp_config.user_id, user_name: @smtp_config.user_name } }
    assert_redirected_to smtp_config_url(@smtp_config)
  end

  test "should destroy smtp_config" do
    assert_difference('SmtpConfig.count', -1) do
      delete smtp_config_url(@smtp_config)
    end

    assert_redirected_to smtp_configs_url
  end
end
