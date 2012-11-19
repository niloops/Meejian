# -*- coding: utf-8 -*-
module InterviewsHelper
  def recommend_control(interview)
    link_to recommend_toggle_topic_interview_path(interview.topic, interview),
    method: :post, class: 'pull-right' do
      interview.recommend? ? "取消推荐" : "推荐"
    end
  end

  def like_control(interview)
    content = content_tag(:i, '', class: 'icon-legal') +
      content_tag(:b, interview.liked_users.count) + "人顶"
    if interview.liked_by?(current_user)
      link_to content, "#", class: 'disabled', id: 'like_control',
      onclick: "event.preventDefault()", title: '您已经顶过此访谈'
    else
      link_to content, like_topic_interview_path(interview.topic, interview),
      method: :post, remote: true, id: 'like_control'
    end
  end
end
