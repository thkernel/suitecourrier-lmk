class TicketUser < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :ticket
  belongs_to :user, :foreign_key => "recipient_id", :class_name => "User"
end
