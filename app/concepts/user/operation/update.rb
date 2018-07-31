class User::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(User, :find_by)
    step Contract::Build( constant: User::Contract::Create )
  end

  step Nested(Present)
  step Contract::Validate( key: :user )
  step Contract::Persist()
end