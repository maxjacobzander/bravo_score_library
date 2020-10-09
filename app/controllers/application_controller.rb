require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "theoperalibrary"
  end

  get "/" do
    if logged_out?
      erb :welcome
    else
      redirect "/scores"
    end
  end


  # Helper Methods

  helpers do
    def logged_in?
      session[:user_id]
    end

    def logged_out?
      !session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if logged_out?
      redirect "/login"
      end
    end

    def redirect_if_logged_in
      if logged_in?
      redirect "/scores"
      end
    end
  end

end
