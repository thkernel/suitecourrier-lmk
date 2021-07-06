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

class Entity < ApplicationRecord
  
  belongs_to :entity_type

  belongs_to :user

  # Self-relationship
  belongs_to :parent_entity, class_name: "Entity", optional: true
  
  #This is option for the self relationship.
  has_many :entities, class_name: "Entity", foreign_key: "parent_entity_id"

   # Validations
	validates :name, presence: true, uniqueness: true

end
