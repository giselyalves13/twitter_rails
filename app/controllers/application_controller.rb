class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to sessions_new_path
    end
  end

	def correct_user?
    if params[:controller] == "tweets"
		  tweet = Tweet.find(params[:id])
      user = User.find(tweet[:user_id])
    else
      user = User.find(params[:id])
    end
		unless current_user == user
			redirect_to root_path, notice: 'Não é possível prosseguir'
		end
	end

end
