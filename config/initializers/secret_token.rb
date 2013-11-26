# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Authentication::Application.config.secret_key_base = '7b99bcc35252253353e2d721660cea2632d6b40e61e8580cb07331ad04befc79e814c5ce3f8a71a7827604d8912d3967bd509961d6d7813c2995485550f35646'
