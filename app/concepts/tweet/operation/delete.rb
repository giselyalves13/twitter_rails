require "trailblazer/operation"
require_relative "../../../../app/models/user"
require_relative "../../../../app/models/tweet"
require_relative "../contract/create"

class Tweet::Delete < Trailblazer::Operation
  step Model(Tweet, :find_by)
  step :delete!

  def delete!(options, model:, **)
    model.destroy
  end
end