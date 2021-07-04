class DemoRequest
	include ActiveModel::Model
	attr_accessor :organization_type, :name, :country, :city, :email, :website, :phone_number, :body
	validates :organization_type, :name, :email, :phone_number, :body, presence: true 
end
