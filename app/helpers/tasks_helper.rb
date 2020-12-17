module TasksHelper
    def task(id)
    end
    def imputation_tasks_count(id)
        imputation = Imputation.find(id)
        imputation.tasks.count
    end
end
