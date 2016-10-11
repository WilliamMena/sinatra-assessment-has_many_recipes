require './config/environment'

class SessionController < ApplicationController


  get '/signup' do
    if Helper.logged_in?(session)
      redirect to '/home'
    else
      erb :'/user/create_user'
    end
  end

  post '/signup' do
    if params["username"].empty? || params["password"].empty? || params["email"].empty?
      #create alert about how no spaces can be blank
      redirect to '/signup'
    elsif User.find_by(username: params["username"]) || User.find_by(email: params["email"])
      #alert about how user already exists
      redirect to '/signup'
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect to '/home'
    end
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
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect to '/home'
    else
      # "that username & password combination doesn't exist"
      redirect to '/login'
    end
  end

  get '/logout' do
    erb :'/user/logout'
  end

  post '/logout' do
    session.clear
    redirect to '/login'
  end






end