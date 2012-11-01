module UsersHelper
  def user_avatar_tag(user, version = nil, options = {})
    image_tag user.avatar_url(version), options
  end
end
