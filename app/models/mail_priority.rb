# == Schema Information
#
# Table name: mail_priorities
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  uid                     :string
#  color                   :string
#  processing_time_in_days :integer
#  description             :text
#  status                  :string
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class MailPriority < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user

  # Change default params ID to uid
  def to_param
    uid
  end

  
end
