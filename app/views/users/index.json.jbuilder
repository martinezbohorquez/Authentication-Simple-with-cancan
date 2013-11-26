json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :email, :password_hash, :password_salt, :active
  json.url user_url(user, format: :json)
end
