class SessionsController < ApplicationController
	before_action :block_access, except: [:destroy]

	def new
	end

	def create 
		@user = User.find_by(user: params[:session][:user].downcase)
		if @user && @user.authenticate(params[:session][:password_digest])
			sign_in
			redirect_to tweets_path
		else
			render action: :new              
	    end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
	
end