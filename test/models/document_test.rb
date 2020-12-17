# == Schema Information
#
# Table name: documents
#
#  id          :bigint           not null, primary key
#  uid         :string
#  slug        :string
#  support_id  :bigint
#  nature_id   :bigint
#  folder_id   :bigint
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
