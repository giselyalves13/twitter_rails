require "rails_helper"

RSpec.describe Tweet, :type => :model do
p Tweet
  before(:all) do
    @tweet1 = create(:tweet)
  end
      p @tweet1

  it "is valid with valid attributes" do
    expect(@tweet1).to be_valid
  end

  it "has a unique id" do
    tweet2 = build(:tweet, id: @tweet1[:id])
    expect(tweet2).to_not be_valid
  end

  it "is not valid without a content" do
    tweet2 = build(:tweet, content: nil)
    expect(tweet2).to_not be_valid
  end

  # it "has a valid user" do
  #   tweet2 = build(:tweet, user_id: 1)
  #   expect(tweet2).to be_valid
  # end

end
