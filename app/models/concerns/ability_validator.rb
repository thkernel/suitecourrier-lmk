class AbilityValidator < ActiveModel::Validator
  
    def validate(record)
  
        ability = Ability.where("role_id = ? AND feature_id = ?", record.role_id, record.feature_id)
  
      if ability.present?
            record.errors.add(:ability, "with the same role and feature exists.")
        end
    end
  
  end