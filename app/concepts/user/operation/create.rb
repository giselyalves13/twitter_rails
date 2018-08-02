require "trailblazer/operation"
require_relative "../../../../app/models/user"
require_relative "../../../../app/models/tweet"
require_relative "../contract/create"
require "bcrypt"

class User::Create < Trailblazer::Operation
  include SessionsHelper
  include Model; Model User, :create

 	class Present < Trailblazer::Operation
  	step Model(User, :new)
  	step Contract::Build( constant: User::Contract::Create )
	end

  step Nested( Present )
  step :generate_digest
  step Contract::Validate( key: :user)
  step Contract::Persist()
  success :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New user created #{model.user}.")
  end

	def generate_digest(options, model:, params:, **)
		model.password_digest = BCrypt::Password.create(params[:user][:password])
	end
end
