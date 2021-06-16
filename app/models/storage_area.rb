# == Schema Information
#
# Table name: storage_areas
#
#  id           :bigint           not null, primary key
#  uid          :string
#  name         :string
#  short_name   :string
#  maximum_size :integer
#  path         :string
#  description  :text
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class StorageArea < ApplicationRecord
  belongs_to :user
end
