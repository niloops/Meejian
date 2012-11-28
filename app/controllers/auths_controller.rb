# -*- coding: utf-8 -*-
class AuthsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @auths = current_user.auths.reduce({}) do |auths, a|
      auths[a.provider.to_sym] = a
      auths
    end
  end

  def destroy
    @auth = current_user.auths.find(params[:id])
    current_user.auths.delete @auth
    flash[:success] = "您已取消对#{@auth.name}帐号的#{@auth.provider}绑定"
    redirect_to user_auths_path(current_user)
  end
end
