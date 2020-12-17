# == Schema Information
#
# Table name: priorities
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PriorityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
