# == Schema Information
#
# Table name: tickets
#
#  id             :bigint           not null, primary key
#  uid            :string
#  title          :string
#  priority       :string
#  content        :text
#  due_date       :datetime
#  start_date     :datetime
#  completed_date :datetime
#  status         :string
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
