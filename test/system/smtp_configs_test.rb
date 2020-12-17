require "application_system_test_case"

class SmtpConfigsTest < ApplicationSystemTestCase
  setup do
    @smtp_config = smtp_configs(:one)
  end

  test "visiting the index" do
    visit smtp_configs_url
    assert_selector "h1", text: "Smtp Configs"
  end

  test "creating a Smtp config" do
    visit smtp_configs_url
    click_on "New Smtp Config"

    fill_in "Address", with: @smtp_config.address
    fill_in "Authentification", with: @smtp_config.authentification
    fill_in "Domain", with: @smtp_config.domain
    check "Enable starttls auto" if @smtp_config.enable_starttls_auto
    fill_in "Host", with: @smtp_config.host
    fill_in "Password", with: @smtp_config.password
    fill_in "Port", with: @smtp_config.port
    check "Ssl" if @smtp_config.ssl
    fill_in "User", with: @smtp_config.user_id
    fill_in "User name", with: @smtp_config.user_name
    click_on "Create Smtp config"

    assert_text "Smtp config was successfully created"
    click_on "Back"
  end

  test "updating a Smtp config" do
    visit smtp_configs_url
    click_on "Edit", match: :first

    fill_in "Address", with: @smtp_config.address
    fill_in "Authentification", with: @smtp_config.authentification
    fill_in "Domain", with: @smtp_config.domain
    check "Enable starttls auto" if @smtp_config.enable_starttls_auto
    fill_in "Host", with: @smtp_config.host
    fill_in "Password", with: @smtp_config.password
    fill_in "Port", with: @smtp_config.port
    check "Ssl" if @smtp_config.ssl
    fill_in "User", with: @smtp_config.user_id
    fill_in "User name", with: @smtp_config.user_name
    click_on "Update Smtp config"

    assert_text "Smtp config was successfully updated"
    click_on "Back"
  end

  test "destroying a Smtp config" do
    visit smtp_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smtp config was successfully destroyed"
  end
end
