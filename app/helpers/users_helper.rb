# -*- coding: utf-8 -*-
module UsersHelper
  def user_avatar_tag(user, version = nil, options = {})
    options.merge! alt: user.name
    image_tag user.avatar_url(version), options
  end
end
