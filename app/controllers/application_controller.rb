require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "recipe_secret"
    register Sinatra::Flash
  end


  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  get '/' do 
    erb :index
  end

  get '/home' do
    if logged_in?
      @user = current_user
      @recipe = Recipe.all.sample
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

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipe/recipes'
  end

  get '/recipes/new' do
    @categories = Category.all
    erb :'/recipe/create'
  end

  post '/recipes' do
    if !params["category"] && params["new_category"].empty?
      redirect to '/recipes/new'
    elsif !params["new_category"].empty?
      r = Recipe.new
      r.name = params["name"]
      r.ingredients = params["ingredients"]
      r.serving_size = params["serving_size"].to_i
      r.cook_time = params["cook_time"]
      r.directions = params["directions"]

      r.category = Category.find_or_create_by(name: params["new_category"].strip.downcase.capitalize)
      r.user = current_user
      r.save

      redirect to "/recipes/#{r.id}"
    else
      r = Recipe.new
      r.name = params["name"]
      r.ingredients = params["ingredients"]
      r.serving_size = params["serving_size"].to_i
      r.cook_time = params["cook_time"]
      r.directions = params["directions"]

      r.category = Category.find_by_id(params["category"])
      r.user = current_user
      r.save

      redirect to "/recipes/#{r.id}"
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipe/show'
  end

  post '/follow' do
    f = User.find_by_id(params["follow_id"])
    user = current_user
    user.following << f
    Follower.last.save
    flash[:message] = "You're now following #{f.username}"

    redirect to "/users/#{f.slug}"
  end

  post '/unfollow' do
    host = User.find_by_id(params["unfollow_id"])
    follower = current_user
    Follower.find_by(user_id: host.id, follower_id: follower.id).delete
    flash[:message] = "You've unfollowed #{host.username}"

    redirect to "/users/#{host.slug}"
  end



end