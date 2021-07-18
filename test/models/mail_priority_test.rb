# == Schema Information
#
# Table name: mail_priorities
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MailPriorityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
