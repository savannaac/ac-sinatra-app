class VillagersController < ApplicationController
    get "/villagers" do
        if logged_in?
            @user = current_user
            @villagers = Villager.all

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
        @villager = Villager.create(:name => params[:name], :personality => params[:personality], :species => params[:species], :birthday => params[:birthday], :catchphrase => params[:catchphrase])

        redirect "/villagers/#{@villager.id}"
    end

    get "/villagers/:id" do
        if logged_in?
            @user = current_user
            @villager = Villager.find_by_id(params[:id])
            
            erb :"/villagers/show"
        else
            redirect "/login"
        end
    end

    get "/villagers/:id/edit" do
        @villager = Villager.find_by_id(params[:id])

        erb :"/villagers/edit"
    end

    patch "/villagers/:id" do
        @villager = Villager.find_by_id(params[:id])

            @villager.name = params[:name]
            @villager.personality = params[:personality]
            @villager.species = params[:species]
            @villager.birthday = params[:birthday]
            @villager.catchphrase = params[:catchphrase]
            @villager.save

            redirect to "/villagers/#{@villager.id}"
    end

    delete "/villagers/:id/delete" do
        @villager = Villager.find_by_id(params[:id])
        @villager.delete
        
        redirect "/villagers"
    end
end