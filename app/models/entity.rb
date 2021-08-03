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
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :entity_type

  belongs_to :user

  # Self-relationship
  belongs_to :parent_entity, class_name: "Entity", optional: true
  
  has_many :processing_arrival_mails, class_name: "ArrivalMail", foreign_key: "processing_entity_id"
  has_many :processing_departure_mails, class_name: "DepartureMail", foreign_key: "processing_entity_id"
  has_many :initiating_departure_mails, class_name: "DepartureMail", foreign_key: "initiating_entity_id"

  #This is option for the self relationship.
  has_many :entities, class_name: "Entity", foreign_key: "parent_entity_id"

   # Validations
	validates :name, presence: true, uniqueness: true


  # Change default params ID to uid
  def to_param
    uid
  end

end
