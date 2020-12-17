module ImputationsHelper

    def imputation_item_count(imputation_id)
        imputation_items = ImputationItem.where(imputation_id: imputation_id)
        imputation_items.count if imputation_items.present?
    end
    def service(id)
        Service.find(id)
    end

    def user(id)
        User.find(id)
    end

    def imputation_viewed?(imputation)
        if imputation.viewed_at.present?
            "Oui"
        else
            "Non"
        end

    end
end
