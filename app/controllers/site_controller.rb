class SiteController < ApplicationController
  def inviteds
    @users = InvitedInfo.desc(:created_at)
  end
end
