require './config/environment'

class ApplicationController < Sinatra::Base

  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "recipe_secret"
  end


  get '/' do 
    erb :index
  end

  get '/home' do
    if Helper.logged_in?(session)
      @user = Helper.current_user(session)
      erb :'/session/home'
    else
      redirect to '/login'
    end
  end

  get '/categories' do 
    @categories = Category.all
    erb :'/category/categories'
  end

  get '/categories/:slug' do
    @c = Category.find_by_slug(params[:slug])
    erb :'/category/category'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipe/show'
  end



end