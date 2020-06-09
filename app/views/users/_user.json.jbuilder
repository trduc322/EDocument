json.extract! user, :id, :name, :email, :coin, :DLerr, :created_at, :updated_at
json.url user_url(user, format: :json)
