class HomeController < ApplicationController
  def index
    redirect_to new_user_session_path unless user_signed_in?
    @interviews = Interview.recommended.desc.limit(10)
  end
end
