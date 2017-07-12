class SessionsController < ApplicationController
	def new
		redirect_to root_path
	end

	def create
		@user = User.find_by email: params[:email]

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to root_path
		else
			@error = "Log in failed! Wrong email adress or password."
			render 'home/index'
		end		
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
