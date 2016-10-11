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

  get '/home' do
    if Helper.logged_in?(session)
      @user = Helper.current_user(session)
      erb :'/user/home'
    else
      redirect to '/login'
    end
  end



end