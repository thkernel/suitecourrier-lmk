class InternalMemo < ApplicationRecord
  belongs_to :mail_type
  belongs_to :priority
  belongs_to :correspondent
  belongs_to :folder
  belongs_to :user
end
