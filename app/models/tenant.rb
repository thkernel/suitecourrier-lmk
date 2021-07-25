# == Schema Information
#
# Table name: public.tenants
#
#  id                   :bigint           not null, primary key
#  organization_type_id :bigint
#  organization_name    :string
#  address              :string
#  phone                :string
#  country              :string
#  city                 :string
#  email                :string
#  website              :string
#  subdomain            :string
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Tenant < ApplicationRecord
  

   after_create :create_tenant 
    
    belongs_to :user, optional: true
    belongs_to :organization_type


    validates :organization_type, presence: true
    validates :organization_name, presence: true, uniqueness: true
    validates :subdomain, format: { with: /\A[\w\-]+\Z/i, message: "Le sous-domaine contient des caractères invalide"},
    exclusion: { in: ['www'], message: 'restricted'}

    


    private 
    def tenant_name
      self.subdomain
    end



    # Create tenant db
	def create_tenant 
		Apartment::Tenant.create(self.tenant_name) # Create tenant db
        default_data(self.tenant_name) # Load default data
        create_administrator(self.tenant_name) # Create default admin
		
	end

    def default_data(tenant)
        Apartment::Tenant.switch(tenant) do
            rake "data:default_data"
        end
    end


	#Create the subdomain on the server
	def create_subdomain
	end

	# Create administrator account onto db
	def create_administrator(tenant)

        #Generate password string
		random_password = SecureRandom.alphanumeric(10)
        
		#Switch to the current tenant
		Apartment::Tenant.switch(tenant) do
            # Get all enable record in bank_commission_rate_tracker table.
            admin_user = User.create({
            	email: self.email,
            	password: random_password,
            	password_confirmation: random_password,
            	role_id: Role.find_by(name: "administrator").id
            })

            if admin_user.present?
	            profile = Profile.new
	            profile.user_id = admin_user.id
	            profile.save

                if profile.present?
                    TenantMailJob.perform_now(self)
                end
            end
        end
	end

end
