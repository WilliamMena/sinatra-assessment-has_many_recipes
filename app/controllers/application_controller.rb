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
      erb :'/session/logged_off_home'
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

  get '/follow_list' do
    erb :'/user/follow_list'
  end

  def home_number_view
    if @user.following.length <= 5
      @user.following.length
    else
      5
    end
  end



end