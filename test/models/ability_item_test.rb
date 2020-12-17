# == Schema Information
#
# Table name: ability_items
#
#  id            :bigint           not null, primary key
#  ability_id    :bigint
#  permission_id :bigint
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class AbilityItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
