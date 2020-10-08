class ScoresController < ApplicationController
     
    get '/scores' do
        if logged_in?
            @scores = Score.all
            erb :"scores/index"
        else
            redirect "/login"
        end
    end

    get '/scores/new' do
        erb :"scores/new"
    end

    get '/scores/:id' do
        id = params[:id]
        @score = Score.find_by_id(id)
        erb :"scores/show"
    end

    post '/scores' do
        score = Score.new(params)
        if score.save
            redirect "scores/#{score.id}"
        else
            redirect "scores/new"
        end
    end

    get 'scores/:id/edit' do
        @users = User.all
        @score = Score.find_by_id(params[:id])
        if @score.user.id == current_user.id
            erb :"scores/edit"
        else
            redirect "/scores"
    end

    patch 'scores/:id' do
        @score = Score.find_by_id(params[:id])
        params.delete("_method")
        if @score.update(params)
            redirect "scores/#{score.id}"
        else
            redirect "scores/new"
        end
    end

    delete 'scores/:id' do
        @score = Score.find_by_id(params[:id])
        @score.destroy
        redirect "/scores"
    end

end