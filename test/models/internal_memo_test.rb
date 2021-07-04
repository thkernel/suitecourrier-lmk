# == Schema Information
#
# Table name: internal_memos
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  support_id           :bigint
#  nature_id            :bigint
#  priority_id          :bigint
#  correspondent_id     :bigint
#  initiating_entity_id :bigint
#  processing_entity_id :bigint
#  processing_deadline  :datetime
#  confidential         :boolean
#  folder_id            :bigint
#  object               :string
#  description          :text
#  status               :string
#  year                 :integer
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class InternalMemoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
