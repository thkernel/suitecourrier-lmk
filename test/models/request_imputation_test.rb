# == Schema Information
#
# Table name: request_imputations
#
#  id          :bigint           not null, primary key
#  uid         :string
#  service_id  :bigint
#  receiver_id :bigint
#  request_id  :bigint
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RequestImputationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
