require "application_system_test_case"

class TenantsTest < ApplicationSystemTestCase
  setup do
    @tenant = tenants(:one)
  end

  test "visiting the index" do
    visit tenants_url
    assert_selector "h1", text: "Tenants"
  end

  test "creating a Tenant" do
    visit tenants_url
    click_on "New Tenant"

    fill_in "Address", with: @tenant.address
    fill_in "City", with: @tenant.city
    fill_in "Email", with: @tenant.email
    fill_in "Organization name", with: @tenant.organization_name
    fill_in "Organization type", with: @tenant.organization_type_id
    fill_in "Phone", with: @tenant.phone
    fill_in "Status", with: @tenant.status
    fill_in "Subdomain", with: @tenant.subdomain
    fill_in "Website", with: @tenant.website
    click_on "Create Tenant"

    assert_text "Tenant was successfully created"
    click_on "Back"
  end

  test "updating a Tenant" do
    visit tenants_url
    click_on "Edit", match: :first

    fill_in "Address", with: @tenant.address
    fill_in "City", with: @tenant.city
    fill_in "Email", with: @tenant.email
    fill_in "Organization name", with: @tenant.organization_name
    fill_in "Organization type", with: @tenant.organization_type_id
    fill_in "Phone", with: @tenant.phone
    fill_in "Status", with: @tenant.status
    fill_in "Subdomain", with: @tenant.subdomain
    fill_in "Website", with: @tenant.website
    click_on "Update Tenant"

    assert_text "Tenant was successfully updated"
    click_on "Back"
  end

  test "destroying a Tenant" do
    visit tenants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tenant was successfully destroyed"
  end
end
