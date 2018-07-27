class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    include SessionsHelper

    def authorize
      unless logged_in?
        redirect_to sessions_new_path
      end
    end

	def correct_user?(user_id=params[:id])
		user = User.find(user_id)
		unless current_user == user
			redirect_to root_path, notice: 'Não é possível deletar tweet de outros usuários'
		end
	end
	
end
