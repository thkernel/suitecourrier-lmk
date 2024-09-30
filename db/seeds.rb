# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Add initial role in database.


# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback


# Roles

unless Role.all.present?
    roles = Role.create(
        [
            {name: "superuser"},
            {name: "administrator"},
            {name: "guest"},
            {name: "user"},
            {name: "demo"}

            

        ])
else
    roles = Role.all

end





# Users
unless User.all.present?
    users = User.create([
        {login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "superuser").id},
        {login: "root",  email: "root@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "administrator").id},
        {login: "user",  email: "user@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "user").id},
        {login: "guest",  email: "guest@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "guest").id},
        {login: "demo",  email: "demo@gmail.com",  password: "demo2019", password_confirmation: "demo2019", role_id: Role.find_by(name: "superuser").id}


    
    ])
else   
    users = User.all
end








# Profile
unless Profile.all.present?
    profile = Profile.create([
        {
            first_name: "Super",  
            last_name: "User",
            #service_id: services.first.id,   
            user_id: User.find_by(login: "superuser").id
        },
        {
            first_name: "Root",  
            last_name: "Root",
            #service_id: services.first.id, 
            user_id: User.find_by(login: "root").id
        },
        {
            first_name: "User",  
            last_name: "User",
            #service_id: services.first.id, 
            user_id: User.find_by(login: "user").id
        },
        {
            first_name: "Guest",  
            last_name: "Guest",
            #service_id: services.first.id, 
            user_id: User.find_by(login: "guest").id
        },
        {
            first_name: "Demo",  
            last_name: "Demo",
            #service_id: services.first.id, 
            user_id: User.find_by(login: "demo").id
        }
    
    ])

end


# Service.
unless EntityType.all.present?
    entity_types = EntityType.create(
        [
            {name: "Bureau", user_id: users.first.id},
            {name: "Direction",  user_id: users.first.id},
            {name: "Service", user_id: users.first.id}

        ])
else
    entity_types = EntityType.all
end


unless OrganizationType.all.present?
    organization_types = OrganizationType.create(
        [
            {name: "Entreprise", user_id: users.first.id},
            {name: "Banque", user_id: users.first.id},
            {name: "Université", user_id: users.first.id},
            {name: "Collectivité", user_id: users.first.id},
            {name: "Huissier", user_id: users.first.id},
            {name: "Avocat", user_id: users.first.id},
            {name: "Assurance", user_id: users.first.id},
            {name: "Administration", user_id: users.first.id},
   

        ])
else 
    organization_types = OrganizationType.all

end



unless Support.all.present?
    supports = Support.create(
        [
            {name: "Email", user_id: users.first.id},
            {name: "Papier", user_id: users.first.id}
            

        ])

end


unless Nature.all.present?
    natures = Nature.create(
        [
            {name: "Facture", user_id: users.first.id },
            {name: "Lettre" , user_id: users.first.id },
            {name: "Devis" , user_id: users.first.id }

        ])

end


unless CorrespondentType.all.present?
    correspondent_types = CorrespondentType.create(
        [
            {name: "Entreprise", user_id: users.first.id},
            {name: "Banque", user_id: users.first.id},
            {name: "Université", user_id: users.first.id},
            {name: "Collectivité", user_id: users.first.id},
            {name: "Fournisseur", user_id: users.first.id},
            {name: "Client", user_id: users.first.id},
            {name: "Huissier", user_id: users.first.id},
            {name: "Avocat", user_id: users.first.id},
            {name: "Assurance", user_id: users.first.id},
            {name: "Administration", user_id: users.first.id},

        ])
else    
    correspondent_types =  CorrespondentType.all

end

unless Organization.all.present?
    organizations = Organization.create([
        {
            name: "Upcase LLC",  
            organization_type_id: organization_types.first.id,
            web_site: "upcase.net", 
            user_id: users.first.id
        }
    
    ])
else   
    organizations = Organization.all
end


unless Correspondent.all.present?
    correspondents = Correspondent.create(
        [
            {organization_name: "Auctum", correspondent_type_id: correspondent_types.first.id, user_id: users.first.id},
            {organization_name: "Logineo", correspondent_type_id: correspondent_types.first.id, user_id: users.first.id},
            {organization_name: "Ouagadousoft", correspondent_type_id: correspondent_types.first.id, user_id: users.first.id}

        ])

end



unless RegisterType.all.present?
    register_types = RegisterType.create(
        [

            { name: "Registre arrivée",  user_id: users.first.id},
            { name: "Registre départ", user_id: users.first.id}
        ])
else    
    registers =  Register.all

end


unless Register.all.present?
    registers = Register.create(
        [

            {register_type_id: RegisterType.find_by(name: "Registre arrivée").id , name: "COURRIER D'ARRIVÉE 2020",  user_id: users.first.id},
            {register_type_id: RegisterType.find_by(name: "Registre départ").id, name: "COURRIER DEPART 2020", user_id: users.first.id}
        ])
else    
    registers =  Register.all

end




unless Folder.all.present?

    parent = Folder.create({name: "/root", user_id: users.first.id}) # Create parent folder

    folders = Folder.create(
        [
            {name: "Factures", parent_id: parent.id, user_id: users.first.id},
            {name: "Lettres", parent_id: parent.id, user_id: users.first.id},
            {name: "Devis", parent_id: parent.id, user_id: users.first.id},
        ])
else    
    folders =  Folder.all

end


unless TaskType.all.present?
    task_types = TaskType.create(
        [
            {name: "Reponse", user_id: users.first.id},
            {name: "Validation", user_id: users.first.id},
            {name: "Préparation", user_id: users.first.id},
            {name: "Confirmation", user_id: users.first.id}
        ])
else    
    task_types =  TaskType.all

end


unless TaskStatus.all.present?
    task_statuses = TaskStatus.create(
        [
            {name: "En attente", user_id: users.first.id},
            {name: "En cours", user_id: users.first.id},
            {name: "Suspendue", user_id: users.first.id},
            {name: "Terminée", user_id: users.first.id},
            {name: "Annulée", user_id: users.first.id}
        ])
else    
    task_statuses =  TaskStatus.all

end


unless Priority.all.present?
    priorities = Priority.create(
        [
            {name: "Aucune", user_id: users.first.id},
            {name: "Normale", user_id: users.first.id},
            {name: "Basse", user_id: users.first.id},
            {name: "Moyenne", user_id: users.first.id},
            {name: "Haute", user_id: users.first.id},
            {name: "Urgente", user_id: users.first.id}
        ])
else    
    priorities =  Priority.all

end


unless TicketPriority.all.present?
    ticket_priorities = TicketPriority.create(
        [
            {name: "Aucune", user_id: users.first.id},
            {name: "Normale", user_id: users.first.id},
            {name: "Basse", user_id: users.first.id},
            {name: "Moyenne", user_id: users.first.id},
            {name: "Haute", user_id: users.first.id},
            {name: "Urgente", user_id: users.first.id}
        ])
else    
    ticket_priorities =  TicketPriority.all

end

unless TaskPriority.all.present?
    task_priorities = TaskPriority.create(
        [
            {name: "Aucune", user_id: users.first.id},
            {name: "Normale", user_id: users.first.id},
            {name: "Basse", user_id: users.first.id},
            {name: "Moyenne", user_id: users.first.id},
            {name: "Haute", user_id: users.first.id},
            {name: "Urgente", user_id: users.first.id}
        ])
else    
    task_priorities =  TaskPriority.all

end


unless MailPriority.all.present?
    mail_priorities = MailPriority.create(
        [
            {name: "Aucune", user_id: users.first.id},
            {name: "Normale", user_id: users.first.id},
            {name: "Basse", user_id: users.first.id},
            {name: "Moyenne", user_id: users.first.id},
            {name: "Haute", user_id: users.first.id},
            {name: "Urgente", user_id: users.first.id}
        ])
else    
    mail_priorities =  MailPriority.all

end


unless MailStatus.all.present?
    mail_status = MailStatus.create(
        [
            {name: "A traiter", user_id: users.first.id},
            {name: "A valider", user_id: users.first.id},
            {name: "A archiver", user_id: users.first.id},
            
        ])
else    
    mail_status =  MailStatus.all

end

unless MailType.all.present?
    mail_types = MailType.create(
        [
            {name: "Personnel", user_id: users.first.id},
            {name: "Confidentiel", user_id: users.first.id},
            {name: "Professionnel", user_id: users.first.id},
            
        ])
else    
    mail_type =  MailType.all

end

unless MailCategory.all.present?
    mail_categories = MailCategory.create(
        [
            {name: "Education", user_id: users.first.id},
            {name: "Juridique", user_id: users.first.id},
            {name: "Social", user_id: users.first.id},
            {name: "Association", user_id: users.first.id},
            {name: "Autre", user_id: users.first.id},
            {name: "Correspondance", user_id: users.first.id},
            {name: "Finance", user_id: users.first.id}
        ])
else    
    mail_categories =  MailCategory.all

end



unless Feature.all.present?
    features = Feature.create([
        {
            name: "Courrier d'arrivée",
            subject_class: "ArrivalMail"
            
        },
        {
            name: "Courrier départ" ,
            subject_class: "DepartureMail"
            
        },
        {
            name: "Imputation",
            subject_class: "Imputation"
            
        },
        {
            name: "Rôle",
            subject_class: "Role"
            
        },
        {
            name: "Division",
            subject_class: "Division" 
            
        },
        {
            name: "Logs",
            subject_class: "ActivityLog"
            
        },
        {
            name: "Correspondant",
            subject_class: "Correspondent"
            
        },
        {
            name: "Type de correspondant",
            subject_class: "CorrespondentType" 
            
        },
        {
            name: "Service",
            subject_class: "Service"
            
        },
        {
            name: "Configuration SMTP",
            subject_class: "SmtpConfig" 
            
        },

        {
            name: "Registre",
            subject_class: "Register"
            
        },
        {
            name: "Nature",
            subject_class: "Nature" 
            
        },
        {
            name: "Support",
            subject_class: "Support" 
            
        },
        {
            name: "Dossier",
            subject_class: "Folder" 
            
        },
        {
            name: "Direction",
            subject_class: "Direction" 
            
        },
        {
            name: "Demande",
            subject_class: "Request" 
            
        },
        {
            name: "Type de demande",
            subject_class: "RequestType"
            
        },
        {
            name: "Ticket",
            subject_class: "Ticket" 
            
        },
        {
            name: "Document",
            subject_class: "Document" 
            
        },
        {
            name: "Commantaire",
            subject_class: "Comment" 
            
        },
        {
            name: "Organisation",
            subject_class: "Organization" 
            
        },
        {
            name: "Type d'organisation",
            subject_class: "OrganizationType" 
            
        },
        {
            name: "Type de tâche",
            subject_class: "TaskType"   
        },
        {
            name: "Status des tâches",
            subject_class: "TastStatus" 
            
        },
        {
            name: "Permission",
            subject_class: "Permission" 
            
        },
        {
            name: "Utilisateur",
            subject_class: "User" 
            
        },
        {
            name: "Paramètre"
        },
        {
            name: "Configuration" 
        }
    
    ])

end


unless TicketStatus.all.present?
    tiket_statuses = TicketStatus.create([
        {
            name: "Nouveau",
            user_id: users.first.id   
        },
        {
            name: "En cours",
            user_id: users.first.id   
        },
        {
            name: "Résolu",
            user_id: users.first.id    
        },
        {
            name: "Fermé",
            user_id: users.first.id
        },
        {
            name: "Rejeté",
            user_id: users.first.id
        },
        {
            name: "En attente",
            user_id: users.first.id
        }
    ])
end


unless TicketType.all.present?
    ticket_types = TicketType.create([
        {
            name: "Demande",
            user_id: users.first.id    
        },
        {
            name: "Information",
            user_id: users.first.id    
        },
        {
            name: "Confirmation",
            user_id: users.first.id    
        }
    ])
end

