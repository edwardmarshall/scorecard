module ApplicationHelper

  def logged_in?
    session[:user_id]
  end
  # 1. Returning the session[:user_id] if exists otherwitse returns 'nil'

  def current_user
    @user ||= User.find_by_id(session[:user_id])if logged_in?
  end
  # 1. check to see if we are logged
  # 2. if true(logged in) then run argument and set @user to match current user ONLY if @user doesn't exist

	def flash_class(level)
		case level
			when :notice then "success"
			when :error then "error"
			when :alert then "warning"
		end
	end
end
