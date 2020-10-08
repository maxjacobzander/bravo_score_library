class ScoresController < ApplicationController
     
    get '/scores' do
        @scores = Score.all
        erb :"scores/index"
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
        erb :"scores/edit"
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