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

# Direction.
unless Direction.all.present?
    directions = Direction.create(
        [
            {name: "Direction 1" , user_id: users.first.id},
            {name: "Direction 2", user_id: users.first.id},
            {name: "Direction 3", user_id: users.first.id}

        ])
else
    directions = Direction.all
end


# Division.
unless Division.all.present?
    divisions = Division.create(
        [
            {name: "Division 1" , direction_id: directions.first.id, user_id: users.first.id},
            {name: "Division 2", direction_id: directions.first.id, user_id: users.first.id},
            {name: "Division 3", direction_id: directions.first.id, user_id: users.first.id}

        ])
else
    divisions = Division.all
end


# Service.
unless Service.all.present?
    services = Service.create(
        [
            {name: "Informatique", division_id: divisions.first.id , user_id: users.first.id},
            {name: "Direction", division_id: divisions.first.id, user_id: users.first.id},
            {name: "Comptabilité", division_id: divisions.first.id , user_id: users.first.id}

        ])
else
    services = Service.all
end


# Profile
unless Profile.all.present?
    profile = Profile.create([
        {
            first_name: "Super",  
            last_name: "User",
            direction_id: directions.first.id, 
            division_id: divisions.first.id, 
            service_id: services.first.id,   
            user_id: User.find_by(login: "superuser").id
        },
        {
            first_name: "Root",  
            last_name: "Root",
            direction_id: directions.first.id, 
            division_id: divisions.first.id, 
            service_id: services.first.id, 
            user_id: User.find_by(login: "root").id
        },
        {
            first_name: "User",  
            last_name: "User",
            direction_id: directions.first.id, 
            division_id: divisions.first.id, 
            service_id: services.first.id, 
            user_id: User.find_by(login: "user").id
        },
        {
            first_name: "Guest",  
            last_name: "Guest",
            direction_id: directions.first.id, 
            division_id: divisions.first.id, 
            service_id: services.first.id, 
            user_id: User.find_by(login: "guest").id
        },
        {
            first_name: "Demo",  
            last_name: "Demo",
            direction_id: directions.first.id, 
            division_id: divisions.first.id, 
            service_id: services.first.id, 
            user_id: User.find_by(login: "demo").id
        }
    
    ])

end

unless OrganizationType.all.present?
    organization_types = OrganizationType.create(
        [
            {name: "Service en informatique", user_id: users.first.id},
            {name: "ONG", user_id: users.first.id},
            {name: "Université", user_id: users.first.id}
            

        ])
else 
    organization_types = OrganizationType.all

end



=begin
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

=end

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
            {name: "ONG", user_id: users.first.id},
            {name: "Particulier", user_id: users.first.id}

        ])
else    
    correspondent_types =  CorrespondentType.all

end


unless Correspondent.all.present?
    correspondents = Correspondent.create(
        [
            {organization_name: "Auctum", correspondent_type_id: correspondent_types.first.id, user_id: users.first.id},
            {organization_name: "Logineo", correspondent_type_id: correspondent_types.first.id, user_id: users.first.id},
            {organization_name: "Ouagadousoft", correspondent_type_id: correspondent_types.first.id, user_id: users.first.id}

        ])

end





unless Register.all.present?
    registers = Register.create(
        [

            {register_type: REGISTER_TYPES[0][0], name: "COURRIER D'ARRIVÉE 2020",  user_id: users.first.id},
            {register_type: REGISTER_TYPES[1][0], name: "COURRIER DEPART 2020", user_id: users.first.id}
        ])
else    
    registers =  Register.all

end








# Request type.
unless RequestType.all.present?
    request_types = RequestType.create(
        [
            {name: "Demande d'attestation d'admissibilité", user_id: users.first.id},
            {name: "Demande d'authentification de bulletin", user_id: users.first.id}
        ])
else    
    request_types =  RequestType.all

end

unless Folder.all.present?
    folders = Folder.create(
        [
            {name: "FACTURES", user_id: users.first.id},
            {name: "LETTRRES", user_id: users.first.id}
        ])
else    
    folders =  Folder.all

end



unless Feature.all.present?
    features = Feature.create([
        {
            name: "Utilisateurs" 
            
        },
        {
            name: "Paramètres"
        },
        {
            name: "Configurations" 
        }
    
    ])

end