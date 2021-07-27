class TenantEmailJob < ApplicationJob
  queue_as :send_tenant_email_job

  def perform(tenant, admin_password)
    send_tenant_email(tenant, admin_password)
  end

  private

  def send_tenant_email(tenant, admin_password)

  	TenantsMailer.new_tenant_mail(tenant, admin_password).deliver_later
  end
end
