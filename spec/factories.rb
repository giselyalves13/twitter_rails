FactoryBot.define do

  factory :user do
    user "user01"
    user_img "https://farm8.staticflickr.com/7292/16179003767_d07c69309e_c.jpg"
    password "1234"
    password_confirmation "1234"
  end

  factory :tweet do
    content "bibiibi"
    association :index_tweets_on_user_id, factory: :user, user: "zumbi"
  end

  # factory :user do
  #   user "user1111"
  #   user_img "https://farm8.staticflickr.com/7292/16179003767_d07c69309e_c.jpg"
  #   password "1234"
  #   password_confirmation "1234"
  #   after :create do |user|
  #     create_list :tweet, 3, user: user   # has_many
  #   end
  # end

end
