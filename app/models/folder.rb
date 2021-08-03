# == Schema Information
#
# Table name: folders
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  path        :string
#  description :text
#  status      :string
#  parent_id   :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Folder < ApplicationRecord
  include SharedUtils::Generate
  acts_as_tree 

  before_save :generate_random_number_uid
  belongs_to :user

  has_many :arrival_mails, dependent: :destroy

  # Validations
	validates :name, presence: true, uniqueness: true


	# Change default params ID to uid
  def to_param
    uid
  end
  
end
