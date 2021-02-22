class UserEntityItem < ApplicationRecord
  belongs_to :user_entity
  belongs_to :entity
end
