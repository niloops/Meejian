module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:token] = [user.id, user.token]
    current_user = user
  end

  def sign_out
    cookies.delete :token
    current_user = nil
  end

  def signed_in?
    not current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_token
  end

  def current_user?(user)
    user == current_user
  end

  def user_from_token
    id_token = cookies.signed[:token]
    User.find_by_id_with_token(*id_token) if id_token
  end

  def signed_in_user
    redirect_to root_path unless signed_in?
  end
end
