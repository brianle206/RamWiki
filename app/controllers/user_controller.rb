class UserController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  end
  def create_landing
  end
  def login_landing
  end
  def create
 
	user = User.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password])
	if user.save == true
		session[:user_id] = user.id
		redirect_to "/user/index/#{user.id}"
	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to '/user/create_landing'
  	  	
  	end
  end

  def login
  	login = User.find_by_email(params[:email])
  	if login && login.authenticate(params[:password])
  		session[:user_id] = login.id
  		redirect_to "/user/index/#{login.id}"
  	else
  		flash[:email] = "Email or Passwords do not match our records"
  		redirect_to '/login'
  	end
  end

  def edit
  end
  def logout
  	session[:user_id] = nil
  	redirect_to '/'
  end
end
