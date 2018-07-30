require "reform"
require "reform/form/dry"

module User::Contract
  class Create < Reform::Form

    include Dry

    property :user
    property :password_digest
    property :password_confirmation
    property :user_img

    validation do
      required(:user).filled
      required(:password_digest).filled
      required(:password_confirmation).filled
      required(:password_digest).maybe(min_size?: 4)
      # errors.add(:password, "Confirmação de senha errada") if password_digest != password_confirmation
    end
  end
end