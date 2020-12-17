# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  uid                    :string
#  login                  :string
#  slug                   :string
#  role_id                :bigint           not null
#  created_by             :integer
#  status                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#,:confirmable, :lockable, :timeoutable, :trackable


		 include SharedUtils::Generate

		 before_save :generate_random_number_uid, :set_default_status

  # Relationships
	belongs_to :role
	has_many :registers, dependent: :destroy
	has_many :services, dependent: :destroy
	has_many :supports, dependent: :destroy
	has_many :natures, dependent: :destroy
	has_many :correspondent_types, dependent: :destroy
	has_many :organization_types, dependent: :destroy
	has_many :correspondents, dependent: :destroy
	has_many :folders, dependent: :destroy
	has_many :arrival_mails, dependent: :destroy
	has_many :departure_mails, dependent: :destroy
	has_one  :profile, dependent: :destroy
	has_one  :organization, dependent: :destroy
	has_many :imputations, dependent: :destroy
	has_many :request_imputations, dependent: :destroy
	has_many :request_types, dependent: :destroy
	has_many :requests, dependent: :destroy
	has_many :tasks, dependent: :destroy
	has_many :directions, dependent: :destroy
	has_many :divisions, dependent: :destroy
	has_many :documents, dependent: :destroy
	has_many :tickets, dependent: :destroy
	has_many :activity_logs, dependent: :destroy


	has_many :recipient_imputations, :class_name => "Imputation", :foreign_key => :recipient_id
	has_many :recipient_notifications, :class_name => "Notification", :foreign_key => :recipient_id
	has_many :ticket_recipients, :class_name => "TicketUser", :foreign_key => :recipient_id

	
	#has_many :tenants, dependent: :destroy

	# Add nested attributes for profile.
	accepts_nested_attributes_for :profile
	
	# Validations

	#validates :login, presence: true, uniqueness: true

	def superuser?
		if self.role.name == "superuser"
		  true 
		else
		  false
		end
	end
  
	  def admin?
			if self.role.name == "administrator"
				true 
			else
				false
			end
	  end
  
	  def user?
		if self.role.name == "user"
		  true 
		else
		  false
		end
	  end
  
	  def guest?
		if self.role.name == "guest"
		  true 
		else
		  false
		end
	  end

	
	private 

	def set_default_status
		unless self.status.present?
			self.status = "enable"
		end
	end
	

end
