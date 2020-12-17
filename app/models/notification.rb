# == Schema Information
#
# Table name: notifications
#
#  id               :bigint           not null, primary key
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
  
  belongs_to :notificable, polymorphic: true

  belongs_to :user, :foreign_key => "recipient_id", :class_name => "User"

end
