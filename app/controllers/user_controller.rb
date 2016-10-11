require './config/environment'

class UserController < ApplicationController


  get '/users' do
    @users = User.all
    erb :'/user/users'
  end


end