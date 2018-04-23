class SessionsController < ApplicationController
  
  def new
    
  end

  def create
  	user_email = params[:session][:email]
  	user_password = params[:session][:password]
  	u = User.find_by(email: user_email)

  	if u && u.authenticate(user_password)
  		session[:user_id] = u.id

  		flash[:notice] = 'login success'
  		redirect_to root_url
  	else 
  		flash[:error] = 'email or password invalid'
  		render :new
  	end 
  end

  def destroy
  	session[:user_id] = nil 
  	redirect_to root_url
  end
end
