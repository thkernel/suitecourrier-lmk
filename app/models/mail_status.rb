# == Schema Information
#
# Table name: mail_statuses
#
#  id          :bigint           not null, primary key
#  name        :string
#  uid         :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MailStatus < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user

  # Change default params ID to uid
  def to_param
    uid
  end

  
end
