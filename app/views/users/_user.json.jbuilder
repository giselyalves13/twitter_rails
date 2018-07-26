json.extract! user, :id, :user, :password, :user_img, :created_at, :updated_at
json.url user_url(user, format: :json)
