require './config/environment'

class UserController < ApplicationController


  get '/users' do
    @users = User.all
    erb :'/user/users'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/user/show'
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

end