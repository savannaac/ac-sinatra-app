class UsersController < ApplicationController
    get "/signup" do
        if logged_in?
            redirect "/villagers"
        else 
            erb :"/users/signup"
        end
    redirect "/villagers"
    end

    post "/signup" do 
        user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])

        if user.save && user.name != "" && user.email != ""
            session[:user_id] = user.id 
            redirect to "/villagers"
        else 
            redirect "/signup"
        end
    end

    get "/login" do
        if logged_in?
            redirect "/villagers"
        else
            erb :"/users/login"
        end
    end

    post "/login" do
        user = User.find_by(:name => params[:name])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        end
    redirect "/villagers"
    end

    get "/logout" do
        session.clear
        redirect "/"
    end
end