class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    # user = User.where(provider: auth['provider'], uid: auth['uid']).first ||
    #   User.create_with_omniauth(auth)
    # session[:user_id] = user.id
    raise auth.to_yaml
  end

  def new
  end

  def failure
    render text: "Auth error"
  end
end
