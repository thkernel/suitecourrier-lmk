# == Schema Information
#
# Table name: ticket_priorities
#
#  id                      :bigint           not null, primary key
#  uid                     :string
#  name                    :string
#  color                   :string
#  processing_time_in_days :integer
#  description             :text
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class TicketPriority < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid



  # Change default params ID to uid
  def to_param
    uid
  end
  
  
end
