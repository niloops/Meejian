# -*- coding: utf-8 -*-
module TopicsHelper
  def answer_control(topic, can_create)
    return nil unless can_create
    link_to new_topic_interview_path(topic),
    class: 'answer_control btn btn-success' do
      content_tag(:i, '', class: 'icon-fire icon-large') + "参与访谈"
    end
  end

  def take_recommends(topic)
    recommends = topic.interviews.recommended.take(4)
    recommends.take(2) if recommends.count < 4
  end
end
