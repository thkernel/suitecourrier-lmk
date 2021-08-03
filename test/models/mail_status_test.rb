# == Schema Information
#
# Table name: mail_statuses
#
#  id          :bigint           not null, primary key
#  name        :string
#  uid         :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MailStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
