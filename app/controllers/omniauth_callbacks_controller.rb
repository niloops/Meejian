# -*- coding: utf-8 -*-
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    auth_data = request.env["omniauth.auth"]
    user = User.find_by_omniauth(auth_data)
    if user
      sign_in_and_redirect user
    elsif user_signed_in?
      current_user.auths << Auth.from_omniauth(auth_data)
      flash[:success] = "您与#{auth_data[:provider]}的绑定成功"
      redirect_to user_auths_path(current_user)
    else
      session["devise.omniauth"] = auth_data
      redirect_to new_user_registration_path
    end
  end

  alias_method :weibo, :all
end
