# -*- coding: utf-8 -*-
module TopicsHelper
  def answer_control(topic, word = "参与")
    link_to new_topic_interview_path(@topic), class: 'btn btn-primary btn-large' do
      content_tag(:i, '', class: 'icon-comment') + " #{word}"
    end
  end
end
