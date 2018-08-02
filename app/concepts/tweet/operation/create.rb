require "trailblazer/operation"
# require "spec_helper"
require_relative "../../../../app/models/user"
require_relative "../../../../app/models/tweet"
require_relative "../contract/create"
require "bcrypt"

class Tweet::Create < Trailblazer::Operation
  include SessionsHelper
  include Model; Model Tweet, :create
	
	class Present < Trailblazer::Operation
		step Model(Tweet, :new)
  	step Contract::Build( constant: Tweet::Contract::Create )
	end

  step Nested( Present )
  step :define_user_id
  step Contract::Validate( key: :tweet_params)
  failure :notify!
  step Contract::Persist()
  success :notify!

  def notify!(options, **)
    p options
    p options["params"]
    # options["result.notify"] = Rails.logger.info("New tweet created #{model.tweet}.")
    true
  end

  def define_user_id(options, params:, **)
    p params[:id]
    p options
    # tweet_params[:user_id] = params[:id]
    # tweet.permit(:content
    # tweet.permit(:user_id)
    # p tweet
    true
  end

end
