# -*- coding: utf-8 -*-
module AuthsHelper
  def weibo_binding
    link_to user_omniauth_authorize_path(:weibo), class: 'signin_omniauth' do
      image_tag("weibo.png") + "新浪微博绑定"
    end
  end
end
