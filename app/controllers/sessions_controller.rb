class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth['provider'], uid: auth['uid']).first ||
      User.create_with_omniauth(auth)
    session[:user_id] = user.id
    render text: "Signed In"
  end

  def new
    redirect_to '/auth/weibo'
  end

  def failure
    render text: "Auth error"
  end
end
