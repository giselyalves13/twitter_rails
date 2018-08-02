require "reform"
require "reform/form/dry"

module Tweet::Contract
  class Create < Reform::Form
    include Dry
    property :user_id
    property :content

    validation do            
      required(:user_id).filled
      required(:content).filled
    end
  end
end