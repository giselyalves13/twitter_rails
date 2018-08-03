require "rails_helper"

RSpec.describe User, :type => :model do

  before(:all) do
    @user1 = create(:user)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it "has a unique id" do
    user2 = build(:user, id: @user1[:id])
    expect(user2).to_not be_valid
  end

  it "has a unique user" do
    user2 = build(:user, user: "zum")
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a password confirmation" do
    user2 = build(:user, password_confirmation: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a user" do
    user2 = build(:user, user: nil)
    expect(user2).to_not be_valid
  end

end
