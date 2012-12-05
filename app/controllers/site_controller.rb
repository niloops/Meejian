class SiteController < ApplicationController
  def inviteds
    @users = InvitedInfo.desc(:created_at)
  end

  def jobs
  end

  def not_found
  end

  def forbidden
  end

  def server_error
  end
end
