class SessionsController < ApplicationController
	before_action :block_access, except: [:destroy]

	def new 
	end

  def create
    run Session::Create do |result|
    	@user = result["model"][0]
    	sign_in
      return redirect_to root_path
    end
	redirect_to sessions_new_path, notice: 'Falha na autenticação'
  end

	def destroy
		sign_out
		redirect_to root_url
	end
	
end