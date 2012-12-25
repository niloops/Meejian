class HomeController < ApplicationController
  def index
    # bing robot send format :text
    request.format = :html
    if user_signed_in?
      @interviews = Interview.page params[:page]
      render 'signed_in'
    else
      @topics = Topic.recommended
    end
  end
end
