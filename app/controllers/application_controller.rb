class ApplicationController < Sinatra::Base
    configure do 
        set :public_folder, "public"
        set :views, "app/views"
        set :session_secret, "password_security"
        enable :sessions 
    end

    helpers do
        def current_user
            @user = User.find_by_id(session[:user_id])
        end

        def logged_in?
            !!current_user
        end
    end

    get ("/") { erb :index }
end