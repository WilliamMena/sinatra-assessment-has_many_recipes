require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :index
  end

  get '/signup' do
    if Helper.logged_in?(session)
      redirect to '/home'
    else
      erb :'/user/create_user'
    end
  end

  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id
    redirect to '/home'
  end

  get '/login' do
    if Helper.logged_in?(session)
      redirect to '/home'
    else
      erb :'/user/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params["username"])
    binding.pry
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect to '/home'
    else
      #create alert that says, that username & password combination doesn't exists
      redirect to '/login'
    end
  end

#need to create the log in and post log in route as well

  get '/home' do
    if Helper.logged_in?(session)
      @user = Helper.current_user(session)
      erb :'/user/home'
    else
      redirect to '/login'
    end
  end






end