# == Schema Information
#
# Table name: divisions
#
#  id           :bigint           not null, primary key
#  direction_id :bigint
#  name         :string
#  description  :text
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class DivisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
