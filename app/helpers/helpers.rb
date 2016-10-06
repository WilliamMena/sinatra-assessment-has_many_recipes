class Helper < ApplicationController

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.logged_in?(session)
    if session[:user_id]
      return true
    else
      return false
    end
  end

end