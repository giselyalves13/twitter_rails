require "rails_helper"

RSpec.describe User, :type => :model do

  before(:all) do
    @user1 = build(:user)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it "has a unique user" do
    user_teste = create(:user, user: "joao")
    expect(user_teste).to be_valid
    user2 = build(:user, user: user_teste[:user])
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid with a short password" do
    user2 = build(:user, password: "abc")
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

  it "is valid with has_many tweets association" do
    subject { described_class.new }
    assc = described_class.reflect_on_association(:tweets)
    expect(assc.macro).to eq :has_many
  end

end
