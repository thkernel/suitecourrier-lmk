class Entity < ApplicationRecord
  belongs_to :parent_entity
  belongs_to :entity_type
  belongs_to :user
end
