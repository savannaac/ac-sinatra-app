class UsersController < ApplicationController
    get "/signup" do
        if logged_in?
            redirect "/villagers"
        else 
            erb :"/users/signup"
        end
    end

    post "/signup" do 
        user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])

        if user.save && user.name != "" && user.email != ""
            session[:user_id] = user.id 
            redirect "/villagers"
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
        @user = User.find_by(:email => params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/villagers"
        end
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect "/"
        end
    end
end