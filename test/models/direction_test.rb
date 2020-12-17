# == Schema Information
#
# Table name: directions
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

class DirectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
