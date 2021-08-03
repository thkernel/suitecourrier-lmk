# == Schema Information
#
# Table name: notifications
#
#  id               :bigint           not null, primary key
#  uid              :string
#  nature           :string
#  recipient_id     :bigint
#  content          :text
#  status           :string
#  readed_at        :datetime
#  notificable_type :string
#  notificable_id   :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Notification < ApplicationRecord
	include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  
  belongs_to :notificable, polymorphic: true

  belongs_to :user, :foreign_key => "recipient_id", :class_name => "User"

  # Change default params ID to uid
  def to_param
    uid
  end

  

end
