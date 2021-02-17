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

require 'test_helper'

class TicketUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
