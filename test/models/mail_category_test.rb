# == Schema Information
#
# Table name: mail_categories
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

class MailCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
