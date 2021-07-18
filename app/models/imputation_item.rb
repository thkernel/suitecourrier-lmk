# == Schema Information
#
# Table name: imputation_items
#
#  id             :bigint           not null, primary key
#  uid            :string
#  task_type_id   :bigint
#  title          :string
#  priority_id    :bigint
#  due_date       :datetime
#  start_date     :datetime
#  completed_date :datetime
#  task_status_id :bigint
#  description    :text
#  imputation_id  :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ImputationItem < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :imputation
  belongs_to :task_status
  belongs_to :task_type
  belongs_to :task_priority
  

  scope :completed, ->{where("task_status_id = ?", TaskStatus.find_by(name: "Terminée").id)}
  scope :uncompleted, ->{where("task_status_id IS NOT ?", TaskStatus.find_by(name: "Terminée").id)}

  # Validations.
  #validates :title, presence: true
  validates :task_type_id, presence: true
  validates :priority_id, presence: true
  validates :task_status_id, presence: true

end
