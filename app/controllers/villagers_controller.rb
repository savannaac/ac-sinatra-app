class VillagersController < ApplicationController
    get "/villagers" do
        if logged_in?
            @villagers = current_user.villagers

            erb :"/villagers/index"
        else
            redirect "/login"
        end
    end

    get "/villagers/new" do
        if logged_in?
            @user = current_user

            erb :"/villagers/create"
        else 
            redirect "/login"
        end
    end

    post "/villagers" do
        @villager = Villager.create(:name => params[:name], :personality => params[:personality], :species => params[:species], :birthday => params[:birthday], :catchphrase => params[:catchphrase], :status => params[:status], :user_id => current_user.id)

        redirect "/villagers/#{@villager.id}"
    end

    get "/villagers/:id" do
            @user = current_user
            @villager = Villager.find_by_id(params[:id])

        # updated here also
        if logged_in? && @villager.user_id == current_user.id
            
            erb :"/villagers/show"
        else
            redirect "/login"
        end
    end

    get "/villagers/:id/edit" do
        @villager = Villager.find_by_id(params[:id])
        
        # updated here
        if @villager.user_id == current_user.id
            erb :"/villagers/edit"
        else
            redirect "/login"
        end
    end

    patch "/villagers/:id" do
        @villager = Villager.find_by_id(params[:id])

        # updated here
        if @villager.user_id == current_user.id
            @villager.name = params[:name]
            @villager.personality = params[:personality]
            @villager.species = params[:species]
            @villager.birthday = params[:birthday]
            @villager.catchphrase = params[:catchphrase]
            @villager.status = params[:status]
            @villager.save

            redirect "/villagers/#{@villager.id}"
        else
            redirect "/login"
        end
    end

    delete "/villagers/:id/delete" do
        @villager = Villager.find_by_id(params[:id])

        # updated here
        if @villager.user_id == current_user.id
            @villager.delete
        
            redirect "/villagers"
        else
            redirect "/login"
        end
    end
end