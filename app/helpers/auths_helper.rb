# -*- coding: utf-8 -*-
module AuthsHelper
  def weibo_binding
    link_to user_omniauth_authorize_path(:weibo), class: 'signin_omniauth' do
      image_tag("weibo.png") + "新浪微博绑定"
    end
  end

  def any_binding?
    current_user and current_user.auths?
  end
end
