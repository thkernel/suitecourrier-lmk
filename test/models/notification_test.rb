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

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
