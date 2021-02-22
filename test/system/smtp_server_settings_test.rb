require "application_system_test_case"

class SmtpServerSettingsTest < ApplicationSystemTestCase
  setup do
    @smtp_server_setting = smtp_server_settings(:one)
  end

  test "visiting the index" do
    visit smtp_server_settings_url
    assert_selector "h1", text: "Smtp Server Settings"
  end

  test "creating a Smtp server setting" do
    visit smtp_server_settings_url
    click_on "New Smtp Server Setting"

    fill_in "Authentication", with: @smtp_server_setting.authentication
    fill_in "Authentication method", with: @smtp_server_setting.authentication_method
    fill_in "Delivery method", with: @smtp_server_setting.delivery_method
    fill_in "Domain", with: @smtp_server_setting.domain
    check "Enable starttls auto" if @smtp_server_setting.enable_starttls_auto
    fill_in "Host", with: @smtp_server_setting.host
    fill_in "Password", with: @smtp_server_setting.password
    fill_in "Port", with: @smtp_server_setting.port
    fill_in "Sending address", with: @smtp_server_setting.sending_address
    check "Ssl" if @smtp_server_setting.ssl
    fill_in "User", with: @smtp_server_setting.user_id
    fill_in "User name", with: @smtp_server_setting.user_name
    click_on "Create Smtp server setting"

    assert_text "Smtp server setting was successfully created"
    click_on "Back"
  end

  test "updating a Smtp server setting" do
    visit smtp_server_settings_url
    click_on "Edit", match: :first

    fill_in "Authentication", with: @smtp_server_setting.authentication
    fill_in "Authentication method", with: @smtp_server_setting.authentication_method
    fill_in "Delivery method", with: @smtp_server_setting.delivery_method
    fill_in "Domain", with: @smtp_server_setting.domain
    check "Enable starttls auto" if @smtp_server_setting.enable_starttls_auto
    fill_in "Host", with: @smtp_server_setting.host
    fill_in "Password", with: @smtp_server_setting.password
    fill_in "Port", with: @smtp_server_setting.port
    fill_in "Sending address", with: @smtp_server_setting.sending_address
    check "Ssl" if @smtp_server_setting.ssl
    fill_in "User", with: @smtp_server_setting.user_id
    fill_in "User name", with: @smtp_server_setting.user_name
    click_on "Update Smtp server setting"

    assert_text "Smtp server setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Smtp server setting" do
    visit smtp_server_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smtp server setting was successfully destroyed"
  end
end
