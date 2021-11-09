class UsersController < ApplicationController
	protect_from_forgery
	before_action :verify_login, only: [:show, :index]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to login_path, :notice => "You successfully Signed up, Please login to continue!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@user = User.all
	end

	def verify_login
		if !current_user
			if params[:user] && params[:user][:username] && params[:user][:password]
				@user = User.authenticate(params[:user][:username], params[:user][:password])
			end
			if @user
				session[:user_id] = @user.id
				redirect_to root_url, :notice => "Logged in!"
			else
				flash.now.alert = "Invalid email or password" if params[:user]
				render "verify_login"
			end
		end
	end

	def password
	end

	def destroy_login
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

	private
	
	def user_params
		params.require(:user).permit(:username, :password, :confirm_password)
	end

end
