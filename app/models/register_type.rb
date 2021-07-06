# == Schema Information
#
# Table name: register_types
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  short_name  :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RegisterType < ApplicationRecord
  belongs_to :user
  has_many :registers , dependent: :destroy
  # Validations
	validates :name, presence: true, uniqueness: true
end
