# -*- coding: utf-8 -*-
module InterviewsHelper
  def recommend_control(interview)
    link_to recommend_toggle_topic_interview_path(interview.topic, interview),
    method: :post, class: 'btn btn-warning' do
      interview.recommend? ? "取消推荐" : "推荐"
    end
  end

  def like_control(interview)
    if interview.liked_by?(current_user)
      link = '#'
      disabled = true
      method = :get
    else
      link = like_topic_interview_path(interview.topic, interview)
      disabled = false
      method = :post
    end
    link_to link, method: method, disabled: disabled,
    class: 'btn btn-primary', id: 'like_control' do
      content_tag(:i, '', class: 'icon-legal') +
      content_tag(:b, interview.liked_users.count) +
      "人顶"
    end
  end
end
