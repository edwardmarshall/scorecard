class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user # this allows me to use the User info from anywhere
  	User.find_by_id(session[:user_id])
  end

end
