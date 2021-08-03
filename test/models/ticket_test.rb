# == Schema Information
#
# Table name: tickets
#
#  id                 :bigint           not null, primary key
#  uid                :string
#  reference          :string
#  ticket_type_id     :bigint
#  title              :string
#  ticket_priority_id :bigint
#  content            :text
#  due_date           :date
#  start_date         :date
#  completed_date     :date
#  ticket_status_id   :bigint
#  year               :integer
#  user_id            :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
