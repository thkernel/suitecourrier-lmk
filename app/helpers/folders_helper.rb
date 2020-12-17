module FoldersHelper
    def folder_name(id)

        if id.present?
            Folder.find(id).name
        end
        
    end
end
