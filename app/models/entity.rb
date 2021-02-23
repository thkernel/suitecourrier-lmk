class Entity < ApplicationRecord
  
  belongs_to :entity_type

  belongs_to :user

  # Self-relationship
  belongs_to :parent_entity, class_name: "Entity", optional: true
  
  #This is option for the self relationship.
  has_many :entities, class_name: "Entity", foreign_key: "parent_entity_id"

end
