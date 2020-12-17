module ImputationValidator
    class ImputationUnicityValidator < ActiveModel::Validator
  
        def validate(record)
      
            imputation = Imputation.where("recipient_id = ? AND imputable_id = ?", record.recipient_id, record.imputable_id)
      
          if imputation.present?
                record.errors.add(:imputation,"must be imputed to recipient only once")
            end
    
            puts "RECORD: #{record.imputation_items.inspect}"
        end
      
    end


    class ImputationItemValidator < ActiveModel::Validator
  
        def validate(record)
      
      
          if record.imputation_items.blank?
                record.errors.add(:imputation,"must contain elements")
            end
    
            
        end
      
      end
end