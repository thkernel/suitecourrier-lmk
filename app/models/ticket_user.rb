# == Schema Information
#
# Table name: ticket_users
#
#  id           :bigint           not null, primary key
#  uid          :string
#  ticket_id    :bigint
#  recipient_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TicketUser < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :ticket
  belongs_to :user, :foreign_key => "recipient_id", :class_name => "User"
end
