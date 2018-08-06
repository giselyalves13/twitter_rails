require "rails_helper"

RSpec.describe Tweet, :type => :model do
  before(:all) do
    @tweet1 = build(:tweet)
  end

  it "is valid with valid attributes" do
    expect(@tweet1).to be_valid
  end

  it "is not valid without a content" do
    tweet2 = build(:tweet, content: nil)
    expect(tweet2).to_not be_valid
  end

  it "is not valid with more than 140 characters" do
    tweet2 = build(:tweet, content: "hauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhsauhhauhs")
    expect(tweet2).to_not be_valid
  end

  it "is valid with belongs_to association" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end
