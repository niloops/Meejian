class SiteController < ApplicationController
  def search
    redirect_to "https://www.google.com.hk/#hl=zh-CN&q=site:#{Settings.host}+#{params[:q]}"
  end

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
