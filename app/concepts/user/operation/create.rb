require "trailblazer/operation"
# require "spec_helper"
require_relative "../../../../app/models/user"
require_relative "../../../../app/models/tweet"
require_relative "../contract/create"

class User::Create < Trailblazer::Operation
    include SessionsHelper

		# step Policy::Guard( :authorize! )
	
	 	class Present < Trailblazer::Operation
    	step Model(User, :new)
    	step Contract::Build( constant: User::Contract::Create )
  	end
	  
	  step Nested( Present )
	  step Contract::Validate( key: :user )
	  step Contract::Persist( )
	  step :notify!

    def authorize!(options, **) 
	    current_user.logged_in?
	  end

	  def notify!(options, model:, **)
	    options["result.notify"] = Rails.logger.info("New user created #{model.user}.")
	  end

end
