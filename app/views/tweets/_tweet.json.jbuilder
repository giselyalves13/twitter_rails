json.extract! tweet, :id, :user, :user_img, :content, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
