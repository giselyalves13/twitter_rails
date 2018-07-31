require "trailblazer/operation"
# require "spec_helper"
require_relative "../../../../app/models/user"
require_relative "../../../../app/models/tweet"
require_relative "../contract/create"
require "bcrypt"

class User::Create < Trailblazer::Operation
    include SessionsHelper
	  include Model; Model User, :create

		# step Policy::Guard( :authorize! )
	
	 	class Present < Trailblazer::Operation
    	step Model(User, :new)
    	step Contract::Build( constant: User::Contract::Create )
  	end
	  
	  step Nested( Present )
	  step Contract::Validate( key: :user)
	  step Contract::Persist( )
	  success :notify!

    def authorize!(options, **) 
	    current_user.logged_in?
	  end

	  def notify!(options, model:, **)
	    options["result.notify"] = Rails.logger.info("New user created #{model.user}.")
	    true
	  end

		def generate_digest(options, model:, params:, **) 
			model.password_digest = BCrypt::Password.create(params[:user][:password]) 
		end
end
