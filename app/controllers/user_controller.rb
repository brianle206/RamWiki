class UserController < ApplicationController
  def index
  end
  def create_landing
  end
  def create
 
	@user = User.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password])
	if @user.save == true
		redirect_to "/user/index/#{@user.id}"
	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'
  	  	
  	end
  end

  def login
  end

  def edit
  end
end
