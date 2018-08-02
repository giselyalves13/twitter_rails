require "trailblazer/operation"
# require "spec_helper"
require_relative "../../../../app/models/user"

# require_relative "../contract/create"
require "bcrypt"

class Session::Create < Trailblazer::Operation
  include SessionsHelper
  

 	class Present < Trailblazer::Operation
	  step :find_model!

	  def find_model!(options, params:, **)
			options["model"] = User.where(user: params[:session][:user])
			# @user = User.where(user: params[:session][:user])
			# @user = options["model"][0]
		end

  end

  step Nested(Present)
  step :authenticate
  # step :sign_in
  # success :notify!
  # failure :log

  def log(options, **)
  	byebug
  end

	def notify!(options, model:, params:, **)
		options["result.notify"] = Rails.logger.info("New Session created #{params[:session][:user]}.")
		true
	end

	def authenticate(options, model:, params:, **)
		model[0] && model[0].authenticate(params[:session][:password])
	end



end
