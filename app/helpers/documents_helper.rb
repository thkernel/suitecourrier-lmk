module DocumentsHelper

    def support(id)
        Support.find(id)
    end

    def nature(id)
        Nature.find(id)
    end

    def binder(id)
        Binder.find(id)
    end
end
