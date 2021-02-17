# == Schema Information
#
# Table name: activity_logs
#
#  id         :bigint           not null, primary key
#  uid        :string
#  user_id    :bigint
#  browser    :string
#  ip_address :string
#  controller :string
#  action     :string
#  params     :string
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ActivityLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
