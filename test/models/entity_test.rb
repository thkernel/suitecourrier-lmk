# == Schema Information
#
# Table name: entities
#
#  id               :bigint           not null, primary key
#  uid              :string
#  parent_entity_id :bigint
#  entity_type_id   :bigint
#  name             :string
#  short_name       :string
#  phone            :string
#  email            :string
#  address          :string
#  description      :text
#  status           :string
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
