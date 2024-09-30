# == Schema Information
#
# Table name: folders
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  path        :string
#  description :text
#  status      :string
#  parent_id   :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Folder < ApplicationRecord
  include SharedUtils::Generate
  acts_as_tree 

  before_save :generate_random_number_uid, :set_default_parent
  belongs_to :user

  has_many :arrival_mails, dependent: :destroy

  # Validations
	validates :name, presence: true, uniqueness: true


	# Change default params ID to uid
  def to_param
    uid
  end

  belongs_to :parent, class_name: "Folder", optional: true
  has_many :children, class_name: "Folder", foreign_key: "parent_id"
  


  def parent_name
    # it may not have a parent
    parent.try(:name)
  end

  def has_parent?
    parent.present?
  end

  def set_default_parent
    default_parent = Folder.find_by(parent_id: nil)

    unless self.parent.present?
      self.parent_id =  default_parent.id
    end
  end

  def has_children?
    children.exists?
  end
  
end
