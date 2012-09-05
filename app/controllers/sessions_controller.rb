class SessionsController < ApplicationController
  def create
    user = User.find_or_create_with_omniauth request.env["omniauth.auth"]
    sign_in user
    redirect_to home_path
  end

  def failure
    render text: "Auth error"
  end

  def cancel
    render text: "Auth cancel"
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
