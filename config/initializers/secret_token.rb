# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Meejian::Application.config.secret_token = 'a7fd2cf6c28697208a7f15d651eca6acb0006778ab220cc23b8933a5115b2561b70498d3ccc916d8a9033b93d785a6d3fb3bf7c88387b06b68fc432d6730b354'

WeiboOAuth2::Config.api_key = Settings.weibo.consumer_key
WeiboOAuth2::Config.api_secret = Settings.weibo.consumer_secret
