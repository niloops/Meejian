class HomeController < ApplicationController
  def index
    if user_signed_in?
      @interviews = Interview.page params[:page]
      render 'signed_in'
    else
      @topics = Topic.recommended
      render 'not_signed_in'
    end
  end
end
