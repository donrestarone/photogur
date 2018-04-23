class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  helper_method :current_user

  def ensure_login
  	redirect_to pictures_path if !current_user
  end

private
	def current_user 
		user_id = session[:user_id]
		if user_id 
			@current_user ||= User.find(user_id)
		end
		
		
	end

end
