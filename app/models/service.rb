# == Schema Information
#
# Table name: services
#
#  id          :bigint           not null, primary key
#  uid         :string
#  division_id :bigint
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  belongs_to :user
  has_many :profiles, dependent: :destroy
  
  # Validations
	validates :name, presence: true, uniqueness: true
end
