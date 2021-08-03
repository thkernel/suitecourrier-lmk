# == Schema Information
#
# Table name: task_statuses
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TaskStatus < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user

  # Validations
	validates :name, presence: true, uniqueness: true


	# Change default params ID to uid
  def to_param
    uid
  end
  
end
