# == Schema Information
#
# Table name: departure_mails
#
#  id                      :bigint           not null, primary key
#  uid                     :string
#  register_id             :bigint
#  internal_reference      :string
#  departure_date          :datetime
#  linked_to_mail          :string
#  reference_linked_mail   :string
#  to_answer               :string
#  response_limit_time     :datetime
#  response_date           :datetime
#  support_id              :bigint
#  nature_id               :bigint
#  correspondent_id        :bigint
#  initiating_entity_id    :bigint
#  initiator_id            :bigint
#  processing_entity_id    :bigint
#  processing_recipient_id :bigint
#  processing_deadline     :datetime
#  validator_id            :bigint
#  validate_deadline       :datetime
#  object                  :string
#  description             :text
#  folder_id               :bigint
#  mail_status_id          :bigint
#  mail_type_id            :bigint
#  mail_category_id        :bigint
#  mail_priority_id        :bigint
#  year                    :integer
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class DepartureMail < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  belongs_to :user
  belongs_to :nature
  belongs_to :register 
  belongs_to :support
  belongs_to :mail_status 
  belongs_to :mail_type 
  belongs_to :mail_category 
  belongs_to :mail_priority
  belongs_to :folder, optional: true
  #has_many :drive_attachments, as: :attachable,  dependent: :destroy


  belongs_to :processing_entity, :foreign_key => "processing_entity_id", :class_name => "Entity"
  belongs_to :processing_recipient, :foreign_key => "processing_recipient_id", :class_name => "User"

  belongs_to :initiating_entity, :foreign_key => "initiating_entity_id", :class_name => "Entity"
  belongs_to :initiator, :foreign_key => "initiator_id", :class_name => "User"
  belongs_to :validator, :foreign_key => "validator_id", :class_name => "User", optional: true

  has_many_attached :files

end
