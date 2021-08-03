# == Schema Information
#
# Table name: permissions
#
#  id         :bigint           not null, primary key
#  uid        :string
#  feature_id :bigint
#  role_id    :bigint
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ApplicationRecord
    include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :role
  belongs_to :feature
  has_many :permission_items,  dependent: :destroy
 

  # Validations.
  #validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :permission_items ,  allow_destroy: true

  # Change default params ID to uid
  def to_param
    uid
  end
  

end
