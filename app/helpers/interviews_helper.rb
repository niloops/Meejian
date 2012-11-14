# -*- coding: utf-8 -*-
module InterviewsHelper
  def recommend_control(interview)
    link_to recommend_toggle_topic_interview_path(interview.topic, interview),
    method: :post, class: 'btn btn-warning' do
      interview.recommend? ? "取消推荐" : "推荐"
    end
  end
end
