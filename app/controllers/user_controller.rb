class UserController < ApplicationController

    get '/users' do
        @users = User.all
        erb :"users/index"
    end

    get 'users/new' do
        erb :"users/new"
    end
end