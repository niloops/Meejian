# -*- coding: utf-8 -*-
module InterviewsHelper
  def answer_control(topic)
    return nil if Interview.find_by_topic_and_author(topic, current_user)
    link_to new_topic_interview_path(topic),
    class: 'answer_control btn btn-success' do
      content_tag(:i, '', class: 'icon-fire icon-large') + "参与访谈"
    end
  end

  def recommend_control(answer)
    link_to recommend_toggle_topic_interview_answer_path(answer.interview.topic,
                                                    answer.interview, answer),
    method: :post  do
      answer.recommend? ? "取消推荐" : "推荐"
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

  def share_control(interview)
    link_to "#", id: 'share_control' do
      content_tag(:i, '', class: 'icon-share-alt') + "微博分享"
    end
  end

  def share_content(interview)
    if interview.author == current_user
      content = "我在##{brand}#参与了访谈【#{interview.topic.title}】: "
    else
      content = "##{brand}#访谈 【#{interview.topic.title}】，来自 #{interview.author.name} : "
    end

    answer = interview.valid_answers.first
    content += answer.question + " "
    content += strip_tags(answer.answer).truncate(60) + " \n"
    content += topic_interview_url(interview.topic, interview)
  end

  def strip_answer(answer)
    strip_tags(answer).gsub('&nbsp;', ' ')
  end
end
