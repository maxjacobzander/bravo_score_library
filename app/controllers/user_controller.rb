class UserController < ApplicationController

    get '/signup' do
        erb :"users/signup"
    end

    post '/users' do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/scores"
        else
            erb :"users/signup"
        end
    end
end