# -*- coding: utf-8 -*-
module MessagesHelper
  def unread_messages_count
    current_user.messages.unread.count
  end

  def message_content(message)
    method = message.class.to_s.underscore
    send method, message if respond_to? method
  end

  def comment_message(message)
    content = content_tag(:i, '', class: 'icon-comment-alt')
    content += senders(message)
    if message.post.author == current_user
      content += "评论了我参与的访谈: "
    else
      content += "评论了我也发布过评论的访谈: "
    end
    content += link_to message.post.topic.title,
    topic_interview_path(message.post.topic, message.post),
    class: "btn btn-link"
  end

  def senders(message)
    links = message.senders.map do |sender|
      link_to sender.name, sender, class: "btn btn-link"
    end.take(5).join('，')

    if message.senders.count > 5
      links += "等#{message.senders.count}人"
    end
    raw links
  end
end
