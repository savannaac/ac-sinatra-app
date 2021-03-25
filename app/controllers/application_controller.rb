class ApplicationController < Sinatra::Base
    configure do 
        set :public_folder, "public"
        set :views, "app/views" #enable :sessions
        set :session_secret, "password_security"
    end

    helpers do
        def logged_in?
            !!current_user
        end

        def current_user
            @user = User.find_by_id(session[:user_id])
        end
    end

    get ("/") { erb :index }

    get "/signup" do
        if logged_in?
            redirect "/villagers"
        else 
            erb :"/signup"
        end
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
            erb :"/login"
        end
    end

    post "/login" do
        user = User.find_by(:name => params[:name])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        end
    redirect "/villagers"
    end

end