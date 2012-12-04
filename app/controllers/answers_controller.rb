# -*- coding: utf-8 -*-
class AnswersController < ApplicationController
  load_and_authorize_resource

  def recommend_toggle
    @topic = Topic.find params[:topic_id]
    @interview = Interview.find(params[:interview_id])
    @answer = @interview.answers.find(params[:id])
    @answer.recommend = !@answer.recommend
    @answer.save
    flash[:success] = @answer.recommend? ? "您推荐了此访谈" : "您取消了对此访谈的推荐"
    redirect_to topic_interview_path(@topic, @interview)
  end
end
