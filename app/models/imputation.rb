# == Schema Information
#
# Table name: imputations
#
#  id             :bigint           not null, primary key
#  uid            :string
#  imputable_type :string
#  imputable_id   :bigint
#  entity_id      :bigint
#  recipient_id   :bigint
#  viewed_at      :datetime
#  status         :string
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Imputation < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  

  belongs_to :user
  belongs_to :user, :foreign_key => "recipient_id", :class_name => "User"
  belongs_to :entity, optional: true
  belongs_to :imputable, polymorphic: true

  has_many :imputation_items, dependent: :destroy
  accepts_nested_attributes_for :imputation_items ,  allow_destroy: true , :reject_if => :no_imputation_items

  validates_with ImputationValidator::ImputationUnicityValidator
  validates_with ImputationValidator::ImputationItemValidator


  # Change default params ID to uid
  def to_param
    uid
  end
  
  private 

  def no_imputation_items(attributes)
   attributes[:task_type_id].blank?
  end
  
  
 
 
end
