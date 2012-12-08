# -*- coding: utf-8 -*-
class MessagesController < ApplicationController
  load_and_authorize_resource

  def index
    @messages = current_user.messages.page params[:page]
    @unread_count = current_user.messages.unread.count
  end

  def readall
    current_user.messages.unread.each {|message| message.read!}
    redirect_to messages_path, notice: "您已将所有未读消息标记为已读"
  end
end
