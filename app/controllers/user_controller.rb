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

end