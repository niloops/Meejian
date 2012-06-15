class SiteController < ApplicationController
  def index
  end

  def signup
    InvitedInfo.create(info: params[:info])
    render "success", layout: false
  end

  def inviteds
    @users = InvitedInfo.desc(:created_at)
  end
end
