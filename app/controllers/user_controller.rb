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