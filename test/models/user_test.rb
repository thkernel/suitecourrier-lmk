# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  uid                    :string
#  login                  :string
#  slug                   :string
#  role_id                :bigint           not null
#  created_by             :integer
#  status                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
