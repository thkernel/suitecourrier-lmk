# == Schema Information
#
# Table name: documents
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  slug                 :string
#  support_id           :bigint
#  mail_type_id         :bigint
#  departure_date       :datetime
#  receipt_date         :datetime
#  correspondent_id     :bigint
#  initiating_entity_id :bigint
#  processing_entity_id :bigint
#  processing_deadline  :datetime
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

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
