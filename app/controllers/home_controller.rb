class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @interviews = Interview.recommended.desc.limit(20)
  end
end
