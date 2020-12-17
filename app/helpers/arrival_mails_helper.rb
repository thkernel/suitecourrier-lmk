module ArrivalMailsHelper

    def folder(id)
        Folder.find(id)
    end
end
