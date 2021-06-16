# == Schema Information
#
# Table name: profiles
#
#  id             :bigint           not null, primary key
#  uid            :string
#  civility       :string
#  first_name     :string
#  last_name      :string
#  position       :string
#  address        :string
#  phone          :string
#  description    :text
#  status         :string
#  entity_type_id :bigint
#  entity_id      :bigint
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Profile < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :user
  belongs_to :service, optional: true
 

  # For active storage
  has_one_attached :avatar


  def full_name
    "#{first_name} #{last_name}"
  end
end
