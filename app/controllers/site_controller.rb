class SiteController < ApplicationController
  def index
  end

  def signup
    InvitedInfo.create(info: params[:info])
    render nothing: true, status: 200
  end

  def inviteds
    @users = InvitedInfo.desc(:created_at)
  end
end
